
package acme.features.authenticated.messages;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.messages.Messages;
import acme.entities.spamFilters.SpamFilter;
import acme.entities.threads.Thread;
import acme.framework.components.Errors;
import acme.framework.components.HttpMethod;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Authenticated;
import acme.framework.entities.Principal;
import acme.framework.services.AbstractCreateService;

@Service
public class AuthenticatedMessageCreateService implements AbstractCreateService<Authenticated, Messages> {

	@Autowired
	AuthenticatedMessageRepository repository;


	@Override
	public boolean authorise(final Request<Messages> request) {
		// TODO Auto-generated method stub
		assert request != null;

		return true;
	}

	@Override
	public void bind(final Request<Messages> request, final Messages entity, final Errors errors) {
		// TODO Auto-generated method stub
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors, "moment");
	}

	@Override
	public void unbind(final Request<Messages> request, final Messages entity, final Model model) {
		// TODO Auto-generated method stub
		assert request != null;
		assert entity != null;
		assert model != null;

		if (request.isMethod(HttpMethod.GET)) {
			model.setAttribute("accept", "false");
		} else {
			request.transfer(model, "accept");
		}

		int idThread = request.getModel().getInteger("id");
		model.setAttribute("idThread", idThread);

		String direccionThread = "../messages/create?id=" + request.getModel().getInteger("id");
		model.setAttribute("direccionThread", direccionThread);

		request.unbind(entity, model, "title", "moment", "tags", "body", "user");

	}

	@Override
	public Messages instantiate(final Request<Messages> request) {
		// TODO Auto-generated method stub
		assert request != null;

		Date moment;
		moment = new Date(System.currentTimeMillis() - 1);

		Principal principal = request.getPrincipal();
		int authenticatedId = principal.getAccountId();
		Authenticated authenticated = this.repository.findOneAuthenticatedByUserAccountId(authenticatedId);

		int idthread = request.getModel().getInteger("id");
		Thread thread = this.repository.findThreadById(idthread);

		Messages result;
		result = new Messages();
		result.setMoment(moment);
		result.setUser(authenticated);
		result.setThread(thread);

		return result;
	}

	@Override
	public void validate(final Request<Messages> request, final Messages entity, final Errors errors) {
		// TODO Auto-generated method stub
		assert request != null;
		assert entity != null;
		assert errors != null;

		int idThread = request.getModel().getInteger("id");
		request.getModel().setAttribute("idThread", idThread);

		boolean checkbox;
		checkbox = request.getModel().getBoolean("accept");
		errors.state(request, checkbox, "accept", "Debe marcar la casilla para publicar el mensaje.");

		String title = entity.getTitle();
		String[] titleArray = title.split(" ");
		String tags = entity.getTags();
		String[] tagsArray = tags.split(" ");
		String body = entity.getBody();
		String[] bodyArray = body.split(" ");

		SpamFilter spamF = this.repository.findSpamFilter();

		String spamWords = spamF.getBadWords();
		String[] spamArray = spamWords.split(",");
		Double threshold = spamF.getThreshold();

		List<String> spamList = IntStream.range(0, spamArray.length).boxed().map(x -> spamArray[x].trim()).collect(Collectors.toList());

		Integer numSpamTitle = (int) IntStream.range(0, titleArray.length).boxed().map(x -> titleArray[x].trim()).filter(i -> spamList.contains(i)).count();
		Integer numSpamTags = (int) IntStream.range(0, tagsArray.length).boxed().map(x -> tagsArray[x].trim()).filter(i -> spamList.contains(i)).count();
		Integer numSpamBody = (int) IntStream.range(0, bodyArray.length).boxed().map(x -> bodyArray[x].trim()).filter(i -> spamList.contains(i)).count();
		boolean isFreeOfSpamTitle = 100 * numSpamTitle / titleArray.length < threshold;
		boolean isFreeOfSpamTags = 100 * numSpamTags / tagsArray.length < threshold;
		boolean isFreeOfSpamBody = 100 * numSpamBody / bodyArray.length < threshold;
		errors.state(request, isFreeOfSpamTitle, "title", "authenticated.message.spamWords");
		errors.state(request, isFreeOfSpamTags, "tags", "authenticated.message.spamWords");
		errors.state(request, isFreeOfSpamBody, "body", "authenticated.message.spamWords");

		String direccionThread = "../messages/create?id=" + request.getModel().getInteger("id");
		request.getModel().setAttribute("direccionThread", direccionThread);
	}

	@Override
	public void create(final Request<Messages> request, final Messages entity) {
		// TODO Auto-generated method stub
		this.repository.save(entity);
	}

}

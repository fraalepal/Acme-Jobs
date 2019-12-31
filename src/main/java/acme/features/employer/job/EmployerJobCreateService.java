
package acme.features.employer.job;

import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.descriptors.Descriptor;
import acme.entities.jobs.Job;
import acme.entities.optionaljob.Optionaljob;
import acme.entities.roles.Employer;
import acme.entities.spamFilters.SpamFilter;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Principal;
import acme.framework.services.AbstractCreateService;

@Service
public class EmployerJobCreateService implements AbstractCreateService<Employer, Job> {

	@Autowired
	EmployerJobRepository repository;


	@Override
	public boolean authorise(final Request<Job> request) {
		assert request != null;

		return true;
	}

	@Override
	public void bind(final Request<Job> request, final Job entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors, "finalMode", "reference", "employer");

	}

	@Override
	public void unbind(final Request<Job> request, final Job entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;
		//Para el control check añado las propiedades de la entidad opcional
		request.unbind(entity, model, "title", "deadline", "salary", "moreInfo", "status");

	}

	@Override
	public Job instantiate(final Request<Job> request) {
		Job result;
		result = new Job();

		Principal principal = request.getPrincipal();
		Integer principalId = principal.getActiveRoleId();
		Employer employer = this.repository.findEmployerById(principalId);
		Integer jobsCount = this.repository.findJobsCountByEmployerId(principalId) + 1;
		String reference = principal.getUsername().substring(0, 4).toUpperCase() + "-JOB" + jobsCount;
		

		result.setFinalMode(false);
		result.setEmployer(employer);
		result.setReference(reference);
		result.setStatus("Draft");

		return result;
	}

	@Override
	public void validate(final Request<Job> request, final Job entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;
		
		//Control check
		String description = (String) request.getModel().getAttribute("description");
		String link = (String) request.getModel().getAttribute("link");
		
														//NÚMERO DE CARACTERES MÁXIMO A CAMBIAR
		errors.state(request, description.isEmpty() || description.length()<=50, "description", "The description must be blank or have less "
				+ "than 50 characters");
		//Para que no pueda crearse si existe link (que es opcional) pero no descripción
		errors.state(request, !(description.isEmpty() && !link.isEmpty()), "description", "The description can't be blank if"
				+ " there is a link ");		
		
		//Spam
		SpamFilter spam = this.repository.findAllSpamFilters().stream().collect(Collectors.toList()).get(0);
		Stream<String> badWords = Stream.of(spam.getBadWords().split(","));

		String title = (String) request.getModel().getAttribute("title");
		Long countBadWordsInTitle = badWords.filter(x -> title.contains(x)).count();
		errors.state(request, countBadWordsInTitle < spam.getThreshold(), "title", "employer.job.titleHasSpam");

	}

	@Override
	public void create(final Request<Job> request, final Job entity) {
		assert request != null;
		assert entity != null;

		Descriptor descp = new Descriptor();
		descp.setJob(entity);
		descp.setDescription("...");
		
		//CONTROL CHECK
		String description = (String) request.getModel().getAttribute("description");
		String link = (String) request.getModel().getAttribute("link");
		if(!description.isEmpty()) {
			Optionaljob optional = new Optionaljob();
			optional.setDescription(description);
			optional.setLink(link);
			
			optional.setJob(entity);
			this.repository.save(entity);
			this.repository.save(optional);
			this.repository.save(descp);
			
		}else {
		//CONTROL CHECK
		
		this.repository.save(entity);
		this.repository.save(descp);
		}
	}

}


package acme.features.worker.application;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.applications.Application;
import acme.entities.jobs.Job;
import acme.entities.roles.Worker;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.services.AbstractCreateService;

@Service
public class WorkerApplicationCreateService implements AbstractCreateService<Worker, Application> {

	@Autowired
	private WorkerApplicationRepository repository;


	@Override
	public boolean authorise(final Request<Application> request) {
		assert request != null;
		int jobId = request.getModel().getInteger("id");
		Job job = this.repository.findOneJobById(jobId);
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, -1);
		return job.getDeadline().compareTo(calendar.getTime()) > 0 && job.getStatus().equals("Published");
	}

	@Override
	public void bind(final Request<Application> request, final Application entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors, "moment", "reference", "status", "motivo", "job", "worker");
	}

	@Override
	public void unbind(final Request<Application> request, final Application entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;
		String direccionApplication = "../application/create?id=" + request.getModel().getInteger("id");
		model.setAttribute("direccionApplication", direccionApplication);
		request.unbind(entity, model, "statement", "skills", "qualifications");
	}

	@Override
	public Application instantiate(final Request<Application> request) {
		assert request != null;
		Application result = new Application();
		Job job = this.repository.findOneJobById(request.getModel().getInteger("id"));
		result.setJob(job);
		Worker worker = this.repository.findOneWorkerById(request.getPrincipal().getActiveRoleId());
		result.setWorker(worker);
		result.setStatus("Pending");
		Integer applications = this.repository.findApplicationsCountByWorkerJobId(worker.getId(), job.getId()) + 1;
		String reference = "A" + applications + "-J" + job.getId() + ":W" + worker.getId();
		result.setReference(reference);
		return result;
	}

	@Override
	public void validate(final Request<Application> request, final Application entity, final Errors errors) {
		assert request != null;
		assert errors != null;
		assert entity != null;
		String direccionApplication = "../application/create?id=" + request.getModel().getInteger("id");
		request.getModel().setAttribute("direccionApplication", direccionApplication);
	}

	@Override
	public void create(final Request<Application> request, final Application entity) {
		assert request != null;
		assert entity != null;

		Date moment;
		moment = new Date(System.currentTimeMillis() - 1);
		entity.setMoment(moment);
		entity.setMotivo("");
		this.repository.save(entity);
	}

}

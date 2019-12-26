
package acme.features.auditor.auditRecords;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.auditRecords.AuditRecord;
import acme.entities.jobs.Job;
import acme.entities.roles.Auditor;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Principal;
import acme.framework.services.AbstractCreateService;

@Service
public class AuditorAuditRecordCreateService implements AbstractCreateService<Auditor, AuditRecord> {

	@Autowired
	private AuditorRepository repository;


	@Override
	public boolean authorise(final Request<AuditRecord> request) {
		assert request != null;
		return true;
	}

	@Override
	public void bind(final Request<AuditRecord> request, final AuditRecord entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors, "moment");
	}

	@Override
	public void unbind(final Request<AuditRecord> request, final AuditRecord entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		String direccionAudit = "../audit-record/create?id=" + request.getModel().getInteger("id");
		model.setAttribute("direccionAudit", direccionAudit);
		request.unbind(entity, model, "title", "status", "body");

	}

	@Override
	public AuditRecord instantiate(final Request<AuditRecord> request) {
		assert request != null;

		AuditRecord result;
		Principal principal;
		int auditorId;
		Auditor auditor;
		Job job;
		int jobId;

		principal = request.getPrincipal();
		auditorId = principal.getActiveRoleId();
		auditor = this.repository.findOneAuditorById(auditorId);

		jobId = request.getModel().getInteger("id");
		job = this.repository.findOneJobById(jobId);

		result = new AuditRecord();
		result.setAuditor(auditor);

		result.setJob(job);
		return result;
	}

	@Override
	public void validate(final Request<AuditRecord> request, final AuditRecord entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;
	}

	@Override
	public void create(final Request<AuditRecord> request, final AuditRecord entity) {
		assert request != null;
		assert entity != null;

		Date moment;
		moment = new Date(System.currentTimeMillis() - 1);
		entity.setMoment(moment);

		this.repository.save(entity);
	}

}

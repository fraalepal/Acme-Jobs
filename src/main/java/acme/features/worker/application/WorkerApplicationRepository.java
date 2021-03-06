
package acme.features.worker.application;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.applications.Application;
import acme.entities.jobs.Job;
import acme.entities.roles.Worker;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface WorkerApplicationRepository extends AbstractRepository {

	@Query("select a from Application a where a.id = ?1")
	Application findOneApplicationById(int id);
	
	@Query("select a from Job a where a.id = ?1")
	Job findOneJobById(int id);
	
	@Query("select a from Worker a where a.id = ?1")
	Worker findOneWorkerById(int id);

	@Query("select a from Application a where a.worker.id = ?1")
	Collection<Application> findManyByWorkerId(int workerId);
	
	@Query("select count(a) from Application a where a.worker.id = ?1 and a.job.id=?2")
	Integer findApplicationsCountByWorkerJobId(int idWorker, int idJob);

}

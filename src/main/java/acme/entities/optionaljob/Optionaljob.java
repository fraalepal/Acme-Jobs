package acme.entities.optionaljob;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.URL;

import acme.entities.jobs.Job;
import acme.framework.entities.DomainEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
//Cambiar nombre de la entidad en control
public class Optionaljob extends DomainEntity{

	private static final long	serialVersionUID	= 1L;

	@NotNull
	@NotBlank
	//Cambiar en control con el valor especificado
	@Length(max=50)
	private String				description;
	
	@URL
	private String				link;
	
	@Valid
	@OneToOne(optional=false)
	private Job job;
}

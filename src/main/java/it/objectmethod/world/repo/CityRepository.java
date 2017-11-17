package it.objectmethod.world.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import it.objectmethod.world.model.City;

public interface CityRepository extends JpaRepository<City, Long>{

}

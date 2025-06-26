package com.example.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
class LoadDatabase {

  private static final Logger log = LoggerFactory.getLogger(LoadDatabase.class);

  @Bean
  CommandLineRunner initDatabase(PetRepository repository) {
    return args -> {
      log.info("Preloading " + repository.save(new Pet("Rex", "Cachorro", "Labrador", 5, "Joao", "Claudicacao na pata traseira", "Repouso e antiinflamatorio por 7 dias")));
log.info("Preloading " + repository.save(new Pet("Mimi", "Gato", "Persa", 3, "Ana", "Queda de pelos", "Suplemento com omega 3 e racao hipoalergenica")));
log.info("Preloading " + repository.save(new Pet("Nuvem", "Coelho", "Mini Lop", 1, "Carlos", "Ferida na orelha", "Limpeza com soro e pomada antibacteriana 2x/dia")));
log.info("Preloading " + repository.save(new Pet("Tuca", "Tartaruga", "Tigre d'agua", 8, "Alice", "Falta de apetite", "Suplemento de calcio e ajuste de UVB")));
log.info("Preloading " + repository.save(new Pet("Rubi", "Galinha", "Indio Gigante", 3, "Pedro", "Lesao na pata", "Curativo e PVPI diariamente")));
log.info("Preloading " + repository.save(new Pet("Bob", "Cachorro", "SRD", 5, "Luana", "Infeccao de pele", "Banhos terapeuticos e antibiotico por 10 dias")));

    };
  }
}

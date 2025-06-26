package com.example.demo;

import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*") // Permite chamadas de qualquer origem (necessário para Flutter Web)
@RestController
@RequestMapping("/pets")
public class PetController {

    private final PetRepository repository;

    public PetController(PetRepository repository) {
        this.repository = repository;
    }

    // 🔹 Listar todos os pets
    @GetMapping
    public List<Pet> getAllPets() {
        return repository.findAll();
    }

    // 🔹 Criar novo pet
    @PostMapping
    public Pet createPet(@RequestBody Pet newPet) {
        return repository.save(newPet);
    }

    // 🔹 Buscar pet por ID
    @GetMapping("/{id}")
    public Pet getPetById(@PathVariable Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Pet não encontrado com o ID: " + id));
    }

    // 🔹 Atualizar pet existente
    @PutMapping("/{id}")
    public Pet updatePet(@RequestBody Pet updatedPet, @PathVariable Long id) {
        return repository.findById(id)
                .map(pet -> {
                    pet.setNome(updatedPet.getNome());
                    pet.setTipo(updatedPet.getTipo());
                    pet.setRaca(updatedPet.getRaca());
                    pet.setIdade(updatedPet.getIdade());
                    pet.setDono(updatedPet.getDono());
                    pet.setMotivoConsulta(updatedPet.getMotivoConsulta());
                    pet.setIndicacaoCuidados(updatedPet.getIndicacaoCuidados());
                    return repository.save(pet);
                })
                .orElseGet(() -> {
                    updatedPet.setId(id);
                    return repository.save(updatedPet);
                });
    }

    // 🔹 Deletar pet por ID
    @DeleteMapping("/{id}")
    public void deletePet(@PathVariable Long id) {
        repository.deleteById(id);
    }
}

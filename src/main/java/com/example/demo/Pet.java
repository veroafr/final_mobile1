package com.example.demo;

import jakarta.persistence.*;

@Entity
public class Pet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private String tipo;
    private String raca;
    private int idade;
    private String dono;
    private String motivoConsulta;
    private String indicacaoCuidados;

    // 🔹 Constructor vacío (requerido por JPA)
    public Pet() {
    }

    // 🔹 Constructor personalizado (útil para carga inicial)
    public Pet(String nome, String tipo, String raca, int idade, String dono, String motivoConsulta, String indicacaoCuidados) {
    this.nome = nome;
    this.tipo = tipo;
    this.raca = raca;
    this.idade = idade;
    this.dono = dono;
    this.motivoConsulta = motivoConsulta;
    this.indicacaoCuidados = indicacaoCuidados;
    }

    // 🔹 Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getRaca() {
        return raca;
    }

    public void setRaca(String raca) {
        this.raca = raca;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getDono() {
        return dono;
    }

    public void setDono(String dono) {
        this.dono = dono;
    }

    public String getMotivoConsulta() {
        return motivoConsulta;
    }

    public void setMotivoConsulta(String motivoConsulta) {
        this.motivoConsulta = motivoConsulta;
    }

    public String getIndicacaoCuidados() {
        return indicacaoCuidados;
    }

    public void setIndicacaoCuidados(String indicacaoCuidados) {
        this.indicacaoCuidados = indicacaoCuidados;
    }
}

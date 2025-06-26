# 🐾 API e Aplicativo de Cuidados com Pets

Este projeto foi desenvolvido por **Veronica Ferreira**, estudante do 4º semestre do curso de **Tecnologia em Análise e Desenvolvimento de Sistemas (TADS)**, como parte da disciplina de **Programação Mobile I**, ministrada pelo professor **Victor Alvez**, como parte do trabalho final da materia (junho 2025).

## 📱 Descrição

O sistema tem como objetivo gerenciar os **cuidados de pets**, incluindo funcionalidades para registrar informações dos animais, seus donos, motivo da consulta, leito em que estão e orientações médicas.

A aplicação é composta por:
- Um **back-end Java Spring Boot** que fornece a API RESTful.
- Um **front-end Flutter** que consome a API e oferece a interface gráfica.
- Uma **imagem Docker** para facilitar a execução e o deploy do back-end.

---

## 🛠️ Tecnologias Utilizadas

### Backend:
- Java 17
- Spring Boot
- Spring Web
- Spring Data JPA
- H2 Database (ou outro banco relacional configurável)
- Docker

### Frontend:
- Flutter 3.x
- Dart

---

## 🚀 Como Executar o Projeto

### 1. 🐘 Backend (Spring Boot)

```bash
# Navegue até o diretório do projeto backend
cd backend

# Execute o projeto com Maven
./mvnw spring-boot:run

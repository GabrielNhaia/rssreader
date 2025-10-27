# 📰 RSS Reader

Um agregador de feeds RSS/Atom moderno e minimalista, construído com Ruby on Rails 8. Acompanhe suas fontes de notícias favoritas em uma interface elegante com tema escuro.

![Ruby](https://img.shields.io/badge/Ruby-3.3+-red.svg)
![Rails](https://img.shields.io/badge/Rails-8.0-red.svg)
![SQLite](https://img.shields.io/badge/SQLite-3-blue.svg)

## ✨ Funcionalidades

- 📡 **Agregação de Feeds RSS/Atom**: Adicione e gerencie múltiplos feeds de notícias
- 🗂️ **Organização por Categorias**: Organize seus feeds por temas
- 📖 **Leitura Confortável**: Interface otimizada para leitura de conteúdo
- ✅ **Marcação de Leitura**: Marque artigos individualmente ou em lote como lidos
- 🔄 **Atualização Automática**: Sistema de jobs em background para buscar novos conteúdos
- 🎨 **Tema Dark Moderno**: Interface minimalista com design responsivo
- 🖼️ **Tratamento de Imagens**: Controle automático de imagens grandes
- 📝 **Formatação Inteligente**: Auto-formatação de parágrafos para melhor legibilidade

## 🛠️ Tecnologias Utilizadas

### Backend
- **Ruby on Rails 8.0** - Framework web
- **SQLite3** - Banco de dados
- **Feedjira** - Parser de feeds RSS/Atom
- **Solid Queue** - Jobs em background
- **Turbo & Stimulus** - Hotwire para interatividade

### Frontend
- **HTML5 & CSS3** - Markup e estilização
- **JavaScript (ES6+)** - Interatividade
- **Design Responsivo** - Mobile-first approach

## 📋 Pré-requisitos

- Ruby 3.3 ou superior
- Rails 8.0 ou superior
- SQLite3
- Node.js (para importmap)

## 🚀 Instalação e Configuração

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/rssreader.git
cd rssreader
```

### 2. Instale as dependências

```bash
bundle install
```

### 3. Configure o banco de dados

```bash
bin/rails db:create
bin/rails db:migrate
```

### 4. Inicie o servidor

```bash
bin/dev
```

A aplicação estará disponível em `http://localhost:3000`

## 📖 Como Usar

### Adicionando um Feed

1. Clique em **"+ Novo"** na barra superior
2. Preencha:
   - **Nome**: Nome descritivo do feed
   - **URL**: URL do feed RSS/Atom
   - **Categoria**: (Opcional) Categoria para organização
3. Clique em **Salvar**

Os itens do feed serão carregados automaticamente em background.

### Atualizando Feeds

- Clique no botão **"Atualizar"** no topo da página
- Todos os feeds serão atualizados em background via jobs

### Gerenciando Leituras

- **Marcar como lido**: Clique no botão ao lado de cada notícia
- **Marcar todos como lidos**: Na página de um feed específico
- **Filtrar não lidos**: Use o filtro na página principal

## 🏗️ Arquitetura do Projeto

```
app/
├── controllers/
│   ├── feeds_controller.rb          # CRUD de feeds
│   └── feed_items_controller.rb     # Listagem e leitura de itens
├── models/
│   ├── feed.rb                      # Modelo de Feed
│   └── feed_item.rb                 # Modelo de Item de Feed
├── services/
│   └── feed_service.rb              # Lógica de busca e atualização
├── jobs/
│   └── feed_fetcher_job.rb          # Job para atualização em background
├── views/
│   ├── layouts/
│   │   └── application.html.erb     # Layout principal com tema dark
│   ├── feeds/                       # Views de gerenciamento de feeds
│   └── feed_items/                  # Views de leitura de notícias
└── helpers/
    └── feed_items_helper.rb         # Formatação inteligente de conteúdo
```

## 🎨 Design e UX

### Tema Dark Minimalista

O projeto utiliza um design moderno focado em:
- **Paleta de cores escuras** para reduzir fadiga visual
- **Tipografia legível** com line-height otimizado (1.8)
- **Espaçamento generoso** entre elementos
- **Contraste adequado** para acessibilidade

### Formatação Inteligente de Conteúdo

O sistema inclui um helper customizado que:
- Detecta e sanitiza HTML de feeds
- Adiciona quebras de parágrafo automaticamente em texto corrido
- Controla tamanho de imagens
- Mantém formatação de listas, blockquotes e código

## 🔧 Principais Decisões Técnicas

### 1. FeedService Pattern
Separação da lógica de busca de feeds em um service object para:
- Reutilização de código
- Facilitar testes
- Manter controllers enxutos

### 2. Background Jobs
Uso de Solid Queue para processamento assíncrono:
- Evita timeout em requisições HTTP
- Melhora experiência do usuário
- Permite retry automático em caso de falhas

### 3. Sanitização de HTML
Implementação de sanitização customizada para:
- Segurança contra XSS
- Manter formatação útil (links, listas, imagens)
- Remover scripts e tags perigosas

## 🧪 Testes

Execute a suíte de testes:

```bash
bin/rails test
```

## 📝 Roadmap

- [ ] Autenticação de usuários
- [ ] Suporte a múltiplos temas
- [ ] Exportação de feeds (OPML)
- [ ] Busca de conteúdo
- [ ] Marcação com favoritos
- [ ] PWA (Progressive Web App)
- [ ] API REST

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer um fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abrir um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 👨‍💻 Autor

Desenvolvido por **Gabriel** como projeto de portfólio.

Salve para o mano deyvin pela ideia!

---

⭐ Se este projeto foi útil para você, considere dar uma estrela!

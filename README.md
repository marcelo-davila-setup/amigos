# 🚀 MarceloSetup v3.0 - Enterprise Marketing Automation Suite

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/Version-3.0.0-blue.svg)](https://github.com/marcelo-davila-setup/amigos)
[![Platform](https://img.shields.io/badge/Platform-Ubuntu%2020.04%2B-orange.svg)](https://ubuntu.com/)
[![Docker](https://img.shields.io/badge/Docker-20.10%2B-blue.svg)](https://docker.com/)

> **🔥 Setup Completo Enterprise para Automação de Marketing Digital**  
> **Arquitetura enterprise exclusiva com 10+ ferramentas profissionais!**

## ✨ Instalação Enterprise em Uma Linha

```bash
bash <(curl -sSL https://raw.githubusercontent.com/marcelo-davila-setup/amigos/main/marcelosetup.sh)
```

## 🎯 O que é o MarceloSetup v3.0?

O **MarceloSetup v3.0** é a evolução definitiva da nossa suite enterprise de automação de marketing. Com arquitetura **enterprise exclusiva**, oferece uma solução completa que instala e configura automaticamente **10 aplicações profissionais** em sua infraestrutura.

### 🏢 **Arquitetura Enterprise Testada**
- ✅ **Arquitetura Enterprise Exclusiva** - Desenvolvida pela equipe MarceloSetup
- ✅ **10+ Serviços Profissionais** - Stack completo de marketing automation
- ✅ **SSL Automático** - Certificados Let's Encrypt para todos os serviços
- ✅ **Monitoramento Integrado** - Grafana + logs centralizados
- ✅ **Backup Automático** - Proteção diária dos dados
- ✅ **Gerenciamento Simplificado** - CLI tool para controle total

## 🛠️ Stack Completo Enterprise (10 Serviços)

### 🔧 **Infraestrutura Base**
- **🌐 Traefik v3.0** - Reverse proxy com SSL automático
- **💾 PostgreSQL 15** - Banco de dados principal
- **⚡ Redis 7** - Cache e sessões em memória

### 🤖 **Marketing Automation**
- **📱 Evolution API** - WhatsApp Business API completa
- **🤖 Typebot** - Constructor de chatbots visuais + viewer
- **⚙️ n8n** - Automação de workflows avançada
- **💬 Chatwoot** - Central de atendimento omnichannel

### 🗄️ **Storage & Management**
- **📦 MinIO** - Storage S3-compatible para arquivos
- **🐳 Portainer** - Interface para gerenciamento Docker
- **📊 Grafana** - Dashboards e monitoramento avançado
- **⚡ Supabase** - Backend-as-a-Service

## 🌐 Subdomínios Configurados

| Serviço | URL | Descrição |
|---------|-----|-----------|
| **Evolution API** | `https://api.seudominio.com` | WhatsApp Business API |
| **Typebot Builder** | `https://bot.seudominio.com` | Constructor de chatbots |
| **Typebot Viewer** | `https://chat.seudominio.com` | Chatbots publicados |
| **n8n** | `https://n8n.seudominio.com` | Automação de workflows |
| **Chatwoot** | `https://support.seudominio.com` | Central de atendimento |
| **Portainer** | `https://docker.seudominio.com` | Gestão de containers |
| **MinIO** | `https://storage.seudominio.com` | Gestão de arquivos |
| **Grafana** | `https://monitor.seudominio.com` | Dashboards |
| **Traefik** | `https://admin.seudominio.com` | Proxy dashboard |
| **Supabase** | `https://api.seudominio.com/supabase` | Backend API |

## 📋 Requisitos do Sistema

### **Mínimos**
- **SO:** Ubuntu 20.04+ ou Debian 11+
- **RAM:** 6GB (8GB+ recomendado)
- **Disco:** 30GB SSD (50GB+ recomendado)
- **CPU:** 2 cores (4+ cores recomendado)
- **Acesso:** Root/sudo

### **Recomendados**
- **RAM:** 16GB+ para alta performance
- **Disco:** 100GB+ SSD NVMe
- **CPU:** 6+ cores
- **Domínio:** Próprio configurado
- **DNS:** Acesso ao gerenciamento

## 🚀 Guia de Instalação

### **Passo 1: Preparação**

```bash
# Conectar no servidor
ssh root@SEU_IP_DO_SERVIDOR

# Verificar recursos
free -h && df -h && nproc
```

### **Passo 2: DNS (Configure ANTES da instalação)**

Adicione registros A no seu DNS:

```
@ → SEU_IP_DO_SERVIDOR
api → SEU_IP_DO_SERVIDOR
bot → SEU_IP_DO_SERVIDOR  
chat → SEU_IP_DO_SERVIDOR
n8n → SEU_IP_DO_SERVIDOR
support → SEU_IP_DO_SERVIDOR
docker → SEU_IP_DO_SERVIDOR
storage → SEU_IP_DO_SERVIDOR
monitor → SEU_IP_DO_SERVIDOR
admin → SEU_IP_DO_SERVIDOR
```

### **Passo 3: Executar Instalação**

```bash
bash <(curl -sSL https://raw.githubusercontent.com/marcelo-davila-setup/amigos/main/marcelosetup.sh)
```

### **O Script Executa Automaticamente:**

1. ✅ Verificação do sistema (hardware, SO, conectividade)
2. ✅ Aceitação dos termos de serviços premium
3. ✅ Configuração de domínio e email
4. ✅ Instalação das dependências (Docker, Docker Compose)
5. ✅ Configuração de segurança (firewall, senhas)
6. ✅ Geração de credenciais automáticas
7. ✅ Deploy de todos os serviços
8. ✅ Configuração SSL automática
9. ✅ Criação de ferramentas de gestão

## 🔐 Credenciais e Segurança

### **🔑 Sistema de Credenciais**

```bash
# Visualizar credenciais geradas
marcelosetup credentials

# Arquivo seguro (chmod 600)
cat /opt/marcelosetup/configs/credentials.env
```

### **🛡️ Segurança Enterprise**

- ✅ **Senhas de 25+ caracteres** geradas automaticamente
- ✅ **SSL em todos os serviços** via Let's Encrypt  
- ✅ **Firewall UFW** configurado (portas 22, 80, 443)
- ✅ **Containers isolados** em rede privada
- ✅ **Backup automático** diário

## 🔧 Comandos de Gerenciamento

```bash
# Controle de Serviços
marcelosetup start          # Iniciar todos
marcelosetup stop           # Parar todos
marcelosetup restart        # Reiniciar todos

# Monitoramento
marcelosetup status         # Status dos containers
marcelosetup health         # Verificação de saúde
marcelosetup logs           # Logs em tempo real
marcelosetup logs evolution # Log de serviço específico

# Informações
marcelosetup services       # URLs de acesso
marcelosetup credentials    # Credenciais

# Manutenção
marcelosetup update         # Atualizar imagens
```

## 🎯 Configuração Pós-Instalação

### **1. Portainer (Gestão Docker)**
```
URL: https://docker.seudominio.com
- Criar usuário admin
- Conectar Docker local
- Explorar containers
```

### **2. Evolution API (WhatsApp)**
```
URL: https://api.seudominio.com
- Usar API Key das credenciais
- Criar instância WhatsApp
- Conectar QR Code
```

### **3. Typebot (Chatbots)**
```
URL: https://bot.seudominio.com
- Criar conta admin
- Construir chatbots
- Publicar em chat.seudominio.com
```

### **4. n8n (Automação)**
```
URL: https://n8n.seudominio.com
Login: admin / [ver credenciais]
- Criar workflows
- Integrar serviços
- Automatizar processos
```

### **5. Chatwoot (Atendimento)**
```
URL: https://support.seudominio.com
- Configurar canais
- Integrar WhatsApp
- Treinar equipe
```

## 💡 Novidades v3.0

### **🚀 Baseado no OrionDesign**
- ✅ Arquitetura proprietária desenvolvida exclusivamente
- ✅ Stack otimizado com 10 serviços integrados
- ✅ Performance enterprise otimizada

### **🔧 Melhorias Técnicas**
- ✅ Docker Compose v3.8 com orquestração enterprise
- ✅ Traefik v3.0 com SSL automático  
- ✅ PostgreSQL 15 com extensões avançadas
- ✅ Health checks automáticos
- ✅ Volume management persistente

### **🎨 Interface Premium**
- ✅ Progress bar animado com feedback visual
- ✅ Logging colorido e organizado
- ✅ CLI profissional completa
- ✅ Documentação rica incluída

## 🚨 Troubleshooting

### **Problemas Comuns**

**Serviços não iniciam:**
```bash
marcelosetup logs
free -h && df -h
marcelosetup restart
```

**SSL não funciona:**
```bash
nslookup api.seudominio.com
marcelosetup logs traefik
# Aguardar propagação DNS (até 24h)
```

**Performance baixa:**
```bash
htop
docker stats
docker system prune -af
```

## 🔄 Backup Automático

```bash
# Backup diário às 03:00 configurado automaticamente
ls -la /opt/marcelosetup/backups/

# Backup manual
marcelosetup backup

# Conteúdo do backup:
✅ Database PostgreSQL completo
✅ Todos os volumes Docker
✅ Configurações e credenciais
✅ Certificados SSL
```

## 📊 Monitoramento

```bash
# Grafana Dashboard
URL: https://monitor.seudominio.com
Login: admin / [ver credenciais]

# Métricas incluídas:
📈 Container stats
📈 System resources
📈 Network traffic
📈 Application logs
📈 SSL certificate status
```

## 🤝 Suporte Enterprise

### **📞 Canais de Suporte**
- 📧 **Email:** info@marceloautomacoes.com.br
- 🌐 **Website:** [marceloautomacoes.com.br](https://marceloautomacoes.com.br)
- 📱 **Instagram:** [@marceloagentedigital](https://instagram.com/marceloagentedigital)
- 🐛 **Issues:** [GitHub Issues](https://github.com/marcelo-davila-setup/amigos/issues)

### **🎯 Níveis de Suporte**

**🥉 Básico (Incluído):**
- Documentação completa
- GitHub issues
- Updates de segurança

**🥈 Premium:**
- Email direto
- Resposta 24h
- Configuração assistida

**🥇 Enterprise:**
- WhatsApp direto  
- Resposta 4h
- Consultoria completa

## 📄 Licença

```
MIT License - Copyright (c) 2024 Marcelo Dávila

✅ Uso comercial permitido
✅ Modificação permitida  
✅ Distribuição permitida
❌ Sem garantias incluídas
```

## 🙏 Agradecimentos

- **Marcelo Dávila** - Arquiteto e desenvolvedor principal
- **Evolution API** - WhatsApp integration
- **Typebot Team** - Chatbot platform
- **n8n Community** - Workflow automation
- **Docker Community** - Containerization

---

<div align="center">

# 🔥 **MarceloSetup v3.0 Enterprise** 🔥

## **A Suite Mais Completa de Automação de Marketing Digital**

### 💫 **Do Zero ao Profissional em Uma Linha de Comando** 💫

[![⭐ Star no GitHub](https://img.shields.io/badge/⭐%20Star%20no%20GitHub-yellow.svg?style=for-the-badge)](https://github.com/marcelo-davila-setup/amigos)

### **Powered by [@marceloagentedigital](https://github.com/marceloagentedigital) 💪**
### **[marceloautomacoes.com.br](https://marceloautomacoes.com.br) 🌐**

</div>

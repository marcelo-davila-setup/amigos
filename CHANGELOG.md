# 📋 Changelog - MarceloSetup v3.0

All notable changes to this project will be documented in this file.

## [3.0.0] - 2024-12-29

### 🎉 Major Release - Complete Enterprise Suite

#### ✨ Added
- **Complete enterprise marketing automation suite** with 10 professional services
- **Docker Compose v3.8** orchestration with enterprise configuration
- **Traefik v3.0** reverse proxy with automatic SSL certificates
- **PostgreSQL 15** database with advanced extensions
- **Redis 7** for caching and session management
- **Evolution API** for WhatsApp Business integration
- **Typebot Builder + Viewer** for visual chatbot creation
- **n8n** workflow automation platform
- **Chatwoot** omnichannel customer support
- **MinIO** S3-compatible object storage
- **Portainer** Docker container management
- **Grafana** monitoring and analytics dashboards
- **Supabase** Backend-as-a-Service platform

#### 🔧 Technical Features
- **Automatic SSL certificates** via Let's Encrypt for all subdomains
- **Enterprise security** with auto-generated 25+ character passwords
- **UFW firewall configuration** with optimized rules
- **Health checks** for all services with automatic recovery
- **Volume management** for persistent data storage
- **Network isolation** with private Docker networks
- **Progress bar interface** with colored logging
- **Professional CLI tool** for service management

#### 🛡️ Security Enhancements
- **Automatic credential generation** with OpenSSL
- **Container isolation** in private networks
- **Secure file permissions** (chmod 600) for sensitive data
- **SSL encryption** for all web interfaces
- **Firewall protection** allowing only essential ports

#### 📊 Management Tools
- **marcelosetup CLI** with complete service control
- **Automatic daily backups** with 7-day retention
- **Real-time logging** for all services
- **Health monitoring** with individual service checks
- **Update management** for Docker images

#### 🌐 Subdomain Configuration
- `api.domain.com` - Evolution API (WhatsApp Business)
- `bot.domain.com` - Typebot Builder
- `chat.domain.com` - Typebot Viewer
- `n8n.domain.com` - Workflow Automation
- `support.domain.com` - Chatwoot Customer Support
- `docker.domain.com` - Portainer Container Management
- `storage.domain.com` - MinIO Object Storage
- `monitor.domain.com` - Grafana Monitoring
- `admin.domain.com` - Traefik Dashboard
- `api.domain.com/supabase` - Supabase Backend

#### 📦 Installation Features
- **One-line installation** with automatic dependency management
- **System requirements validation** (OS, RAM, disk, CPU)
- **Internet connectivity checks** for reliable deployment
- **Domain and email validation** with proper formatting
- **Interactive setup** with professional branding
- **Terms acceptance** with enterprise service contract

#### 🎯 Enterprise Benefits
- **Complete marketing automation stack** worth R$ 15,000+
- **Production-ready configuration** for immediate use
- **Scalable architecture** for business growth
- **Professional documentation** with comprehensive guides
- **Premium support** channels included

### 🔄 Migration from v2.x
- Complete rewrite with enterprise architecture
- Enhanced security and reliability
- Simplified management with CLI tools
- Comprehensive backup and recovery
- Professional branding and documentation

### 📋 System Requirements
- **OS:** Ubuntu 20.04+ or Debian 11+
- **RAM:** 6GB minimum (8GB+ recommended)
- **Storage:** 30GB minimum (50GB+ recommended)
- **CPU:** 2 cores minimum (4+ cores recommended)
- **Network:** Stable internet connection required
- **Domain:** Own domain with DNS management access

### 🚀 Getting Started
```bash
bash <(curl -sSL https://raw.githubusercontent.com/marcelo-davila-setup/amigos/main/marcelosetup.sh)
```

---

## Previous Versions

### [2.1.0] - 2024-12-28
- Fixed infinite loop issues
- Basic service integration
- Simple Docker Compose setup

### [2.0.0] - 2024-12-27
- Introduction of Docker containerization
- Basic automation services
- Initial WhatsApp integration

### [1.0.0] - 2024-12-26
- Initial release
- Basic server setup
- Manual configuration required

---

**For complete installation and configuration guide, see [README.md](README.md)**

**For support and questions, contact: info@marceloautomacoes.com.br**

**Powered by [@marceloagentedigital](https://github.com/marceloagentedigital)**

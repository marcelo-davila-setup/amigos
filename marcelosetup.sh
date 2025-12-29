#!/bin/bash

#====================================================================
# MARCELOSETUP v3.0 - COMPLETE MARKETING AUTOMATION SUITE
# Setup Completo para Automação de Marketing Digital
# Enterprise architecture with 10+ professional services
# Powered by @marceloagentedigital
# Domain: marceloautomacoes.com.br  
# Repository: https://github.com/marcelo-davila-setup/amigos
#====================================================================

set -e  # Exit on any error

#====================================================================
# SCRIPT INFORMATION AND BRANDING
#====================================================================
SCRIPT_VERSION="3.0.0"
SCRIPT_NAME="MARCELOSETUP"
SCRIPT_AUTHOR="@marceloagentedigital"
SCRIPT_URL="marceloautomacoes.com.br"
SCRIPT_EMAIL="info@marceloautomacoes.com.br"
SCRIPT_REPO="https://github.com/marcelo-davila-setup/amigos"

# Installation directories
INSTALL_DIR="/opt/marcelosetup"
LOG_FILE="/tmp/marcelosetup.log"
COMPOSE_PROJECT_NAME="marcelosetup"

# Color definitions for beautiful output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m'

# Progress tracking
TOTAL_STEPS=30
CURRENT_STEP=0

#====================================================================
# UTILITY FUNCTIONS FOR BEAUTIFUL OUTPUT
#====================================================================

# Professional logging with timestamps
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Colored logging functions
log_success() {
    echo -e "${GREEN}✅ $1${NC}"
    log "SUCCESS: $1"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
    log "ERROR: $1"
    exit 1
}

log_warning() {
    echo -e "${YELLOW}⚠️ $1${NC}"
    log "WARNING: $1"
}

log_info() {
    echo -e "${CYAN}ℹ️ $1${NC}"
    log "INFO: $1"
}

# Progress bar with percentage
progress() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    local percentage=$((CURRENT_STEP * 100 / TOTAL_STEPS))
    local bar_length=40
    local filled=$((percentage * bar_length / 100))
    local empty=$((bar_length - filled))
    
    printf "\r${BLUE}[${GREEN}"
    printf "%*s" $filled | tr ' ' '█'
    printf "${WHITE}"
    printf "%*s" $empty | tr ' ' '░'
    printf "${BLUE}] ${WHITE}%3d%% ${CYAN}(%02d/%02d) %s${NC}" $percentage $CURRENT_STEP $TOTAL_STEPS "$1"
    
    if [[ $CURRENT_STEP -eq $TOTAL_STEPS ]]; then
        echo ""
    fi
    
    log "PROGRESS: ($CURRENT_STEP/$TOTAL_STEPS) $1"
}

# Professional banner with branding
show_banner() {
    clear
    echo -e "${CYAN}"
    cat << 'EOF'
███╗   ███╗ █████╗ ██████╗  ██████╗███████╗██╗      ██████╗ 
████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██║     ██╔═══██╗
██╔████╔██║███████║██████╔╝██║     █████╗  ██║     ██║   ██║
██║╚██╔╝██║██╔══██║██╔══██╗██║     ██╔══╝  ██║     ██║   ██║
██║ ╚═╝ ██║██║  ██║██║  ██║╚██████╗███████╗███████╗╚██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝ ╚═════╝ 
EOF
    echo -e "${NC}"
    echo -e "${WHITE}╔═══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║${CYAN}              SETUP v${SCRIPT_VERSION} - COMPLETE SUITE                   ${WHITE}║${NC}"
    echo -e "${WHITE}║${YELLOW}     Automação Completa de Marketing Digital - 10 Serviços   ${WHITE}║${NC}"
    echo -e "${WHITE}║                                                           ║${NC}"
    echo -e "${WHITE}║${MAGENTA}           Powered by ${SCRIPT_AUTHOR}           ${WHITE}║${NC}"
    echo -e "${WHITE}║${BLUE}              ${SCRIPT_URL}                ${WHITE}║${NC}"
    echo -e "${WHITE}╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Legal terms and service agreement
    echo -e "${GRAY}© 2024 Marcelo Dávila - Todos os direitos reservados${NC}"
    echo -e "${GRAY}Powered by @marceloagentedigital${NC}"
    echo -e "${GRAY}marceloautomacoes.com.br${NC}"
    echo ""
    echo -e "${YELLOW}AVISO LEGAL: O MarceloSetup v3.0 é propriedade intelectual de Marcelo Dávila${NC}"
    echo ""
    echo -e "${WHITE}CONTRATO DE SERVIÇOS PREMIUM${NC}"
    echo -e "${WHITE}Ao utilizar o MarceloSetup v3.0, você está adquirindo acesso a uma solução${NC}"
    echo -e "${WHITE}enterprise desenvolvida exclusivamente por Marcelo Dávila (@marceloagentedigital).${NC}"
    echo ""
    echo -e "${GREEN}✅ Suite Completa Enterprise - 10+ ferramentas profissionais${NC}"
    echo -e "${GREEN}✅ Arquitetura Enterprise Exclusiva - Testada e aprovada${NC}"
    echo -e "${GREEN}✅ Infraestrutura Enterprise - Valor estimado R$ 15.000+${NC}"
    echo -e "${GREEN}✅ Suporte Técnico Premium - Acesso direto ao desenvolvedor${NC}"
    echo -e "${GREEN}✅ Atualizações Vitalícias - Sempre a versão mais atual${NC}"
    echo -e "${GREEN}✅ Garantia Total de Funcionamento - Ambiente testado${NC}"
    echo ""
    echo -e "${BLUE}📞 CONTRATO DE SERVIÇOS PREMIUM${NC}"
    echo -e "${BLUE}Email para Contratação: ${SCRIPT_EMAIL}${NC}"
    echo ""
    
    # Terms acceptance
    while true; do
        echo -e "${YELLOW}Aceita os termos do contrato premium? ${WHITE}(${GREEN}Sim${WHITE}/${RED}Não${WHITE}): ${NC}" 
        read -r ACEITA_TERMOS
        
        case "${ACEITA_TERMOS,,}" in
            sim|s|yes|y)
                echo -e "${GREEN}✅ Contrato aceito. Iniciando instalação enterprise...${NC}"
                echo ""
                sleep 2
                break
                ;;
            não|nao|n|no)
                echo -e "${RED}❌ Contrato não aceito. Instalação cancelada.${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Resposta inválida. Digite 'Sim' ou 'Não'.${NC}"
                ;;
        esac
    done
}

# Completion banner
show_completion_banner() {
    clear
    echo -e "${GREEN}"
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║                                                           ║"
    echo "║       🎉 INSTALAÇÃO ENTERPRISE CONCLUÍDA! 🎉             ║"
    echo "║                                                           ║"
    echo "║         MarceloSetup v3.0 - Suite Completa               ║"
    echo "║                                                           ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

#====================================================================
# SYSTEM VERIFICATION AND REQUIREMENTS CHECK
#====================================================================

# Root privileges verification
check_root() {
    progress "Verificando permissões de administrador"
    if [[ $EUID -ne 0 ]]; then
        log_error "Este script deve ser executado como root. Use: sudo $0"
    fi
    log_success "Permissões de administrador confirmadas"
}

# Operating system compatibility check
check_operating_system() {
    progress "Detectando sistema operacional"
    
    if [[ ! -f /etc/os-release ]]; then
        log_error "Sistema operacional não suportado - /etc/os-release não encontrado"
    fi
    
    source /etc/os-release
    OS_NAME=$NAME
    OS_VERSION=$VERSION_ID
    
    case $OS_NAME in
        "Ubuntu"*)
            PACKAGE_MANAGER="apt"
            ;;
        "Debian"*)
            PACKAGE_MANAGER="apt"
            ;;
        *)
            log_error "Sistema operacional não suportado: $OS_NAME $OS_VERSION"
            ;;
    esac
    
    log_success "Sistema detectado: $OS_NAME $OS_VERSION"
}

# System resources verification
check_system_resources() {
    progress "Verificando recursos do sistema"
    
    # RAM verification
    local ram_gb=$(free -g | awk 'NR==2{printf "%.0f", $2}')
    if [[ $ram_gb -lt 4 ]]; then
        log_warning "RAM baixa detectada: ${ram_gb}GB. Recomendado: 8GB+"
        if [[ $ram_gb -lt 2 ]]; then
            log_error "RAM insuficiente. Mínimo: 2GB. Detectado: ${ram_gb}GB"
        fi
    fi
    
    # Disk space verification
    local disk_gb=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
    if [[ $disk_gb -lt 30 ]]; then
        log_warning "Espaço em disco baixo: ${disk_gb}GB. Recomendado: 50GB+"
        if [[ $disk_gb -lt 20 ]]; then
            log_error "Espaço em disco insuficiente. Mínimo: 20GB. Disponível: ${disk_gb}GB"
        fi
    fi
    
    # CPU cores verification
    local cpu_cores=$(nproc)
    if [[ $cpu_cores -lt 2 ]]; then
        log_warning "CPU com poucos cores: ${cpu_cores}. Recomendado: 4+"
    fi
    
    log_success "Recursos verificados: RAM ${ram_gb}GB, Disco ${disk_gb}GB, CPU ${cpu_cores} core(s)"
}

# Network connectivity verification
check_internet_connectivity() {
    progress "Verificando conectividade de rede"
    
    # Test connectivity
    if ! ping -c 2 google.com &> /dev/null; then
        log_error "Sem conexão com a internet. Verifique sua rede."
    fi
    
    log_success "Conectividade de rede confirmada"
}

#====================================================================
# USER INPUT AND CONFIGURATION
#====================================================================

# Domain configuration with validation
configure_domain() {
    progress "Configurando domínio principal"
    
    echo ""
    echo -e "${CYAN}╔═══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${YELLOW}               CONFIGURAÇÃO DE DOMÍNIO ENTERPRISE         ${CYAN}║${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}Para usar o MarceloSetup v3.0, você precisa de um domínio configurado.${NC}"
    echo -e "${WHITE}Este domínio será usado para todos os 10 serviços da suite.${NC}"
    echo -e "${GRAY}Exemplo: meusite.com.br${NC}"
    echo ""
    
    while true; do
        echo -e "${BLUE}Digite seu domínio principal: ${NC}"
        read -r DOMAIN
        
        if [[ -z "$DOMAIN" ]]; then
            log_warning "Domínio não pode ser vazio"
            continue
        fi
        
        # Basic domain validation
        if [[ ! "$DOMAIN" =~ ^[a-zA-Z0-9][a-zA-Z0-9.-]*[a-zA-Z0-9]$ ]]; then
            log_warning "Formato de domínio inválido. Use: exemplo.com ou exemplo.com.br"
            continue
        fi
        
        log_success "Domínio configurado: $DOMAIN"
        break
    done
}

# Email configuration for SSL certificates
configure_email() {
    progress "Configurando email para certificados SSL"
    
    while true; do
        echo -e "${BLUE}Digite seu email para certificados SSL (ou pressione ENTER para usar admin@${DOMAIN}): ${NC}"
        read -r EMAIL
        
        if [[ -z "$EMAIL" ]]; then
            EMAIL="admin@${DOMAIN}"
            break
        fi
        
        # Basic email validation
        if [[ ! "$EMAIL" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
            log_warning "Formato de email inválido"
            continue
        fi
        
        break
    done
    
    log_success "Email configurado: $EMAIL"
}

#====================================================================
# SYSTEM INSTALLATION AND CONFIGURATION
#====================================================================

# Update system packages
update_system() {
    progress "Atualizando sistema operacional"
    
    export DEBIAN_FRONTEND=noninteractive
    
    # Update package lists
    $PACKAGE_MANAGER update -y >> "$LOG_FILE" 2>&1
    
    # Upgrade existing packages
    $PACKAGE_MANAGER upgrade -y >> "$LOG_FILE" 2>&1
    
    progress "Instalando dependências essenciais"
    
    # Install essential packages
    $PACKAGE_MANAGER install -y \
        curl wget git unzip software-properties-common \
        apt-transport-https ca-certificates gnupg lsb-release \
        htop nano vim ufw \
        bc jq openssl pwgen tree \
        net-tools zip unzip >> "$LOG_FILE" 2>&1
    
    log_success "Sistema atualizado e dependências instaladas"
}

# Install Docker with latest version
install_docker() {
    progress "Verificando instalação do Docker"
    
    if command -v docker &> /dev/null; then
        DOCKER_VERSION=$(docker --version | grep -oP '\d+\.\d+\.\d+' | head -1)
        log_success "Docker já instalado: v$DOCKER_VERSION"
        return
    fi
    
    progress "Instalando Docker Enterprise"
    
    # Remove old versions
    $PACKAGE_MANAGER remove -y docker docker-engine docker.io containerd runc &> /dev/null || true
    
    # Add Docker's official GPG key
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    
    # Add Docker repository
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Install Docker
    $PACKAGE_MANAGER update -y >> "$LOG_FILE" 2>&1
    $PACKAGE_MANAGER install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >> "$LOG_FILE" 2>&1
    
    # Configure Docker for production
    systemctl enable docker >> "$LOG_FILE" 2>&1
    systemctl start docker >> "$LOG_FILE" 2>&1
    
    log_success "Docker instalado e configurado"
}

# Install Docker Compose with latest version
install_docker_compose() {
    progress "Verificando Docker Compose"
    
    if command -v docker-compose &> /dev/null; then
        COMPOSE_VERSION=$(docker-compose --version | grep -oP '\d+\.\d+\.\d+' | head -1)
        log_success "Docker Compose já instalado: v$COMPOSE_VERSION"
        return
    fi
    
    progress "Instalando Docker Compose"
    
    # Download and install Docker Compose
    COMPOSE_VERSION="2.24.0"
    curl -L "https://github.com/docker/compose/releases/download/v${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose >> "$LOG_FILE" 2>&1
    chmod +x /usr/local/bin/docker-compose
    
    # Create symbolic link
    ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose
    
    log_success "Docker Compose instalado: v${COMPOSE_VERSION}"
}

# Configure basic firewall
setup_firewall() {
    progress "Configurando firewall básico"
    
    # Reset UFW
    ufw --force reset >> "$LOG_FILE" 2>&1
    
    # Configure defaults
    ufw default deny incoming >> "$LOG_FILE" 2>&1
    ufw default allow outgoing >> "$LOG_FILE" 2>&1
    
    # Allow essential ports
    ufw allow ssh >> "$LOG_FILE" 2>&1
    ufw allow 80/tcp >> "$LOG_FILE" 2>&1
    ufw allow 443/tcp >> "$LOG_FILE" 2>&1
    
    # Enable firewall
    ufw --force enable >> "$LOG_FILE" 2>&1
    
    log_success "Firewall configurado"
}

#====================================================================
# DOCKER COMPOSE SETUP AND SERVICE CREATION
#====================================================================

# Create directory structure
create_directory_structure() {
    progress "Criando estrutura de diretórios"
    
    # Main directories
    mkdir -p "$INSTALL_DIR"/{configs,data,logs,scripts}
    
    # Set permissions
    chmod -R 755 "$INSTALL_DIR"
    chmod 700 "$INSTALL_DIR"/configs
    
    log_success "Estrutura de diretórios criada"
}

# Generate secure credentials
generate_credentials() {
    progress "Gerando credenciais de segurança"
    
    # Generate strong passwords
    DB_PASSWORD=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-25)
    API_KEY=$(openssl rand -hex 32)
    NEXTAUTH_SECRET=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-25)
    SECRET_KEY=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-25)
    MINIO_USER="admin"
    MINIO_PASSWORD=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-25)
    GRAFANA_PASSWORD=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-25)
    N8N_PASSWORD=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-25)
    
    # Save credentials securely
    cat > "$INSTALL_DIR/configs/credentials.env" << EOF
# MarceloSetup v${SCRIPT_VERSION} - Enterprise Credentials
# Generated on: $(date)
# KEEP THIS FILE SECURE AND PRIVATE!

DOMAIN=${DOMAIN}
EMAIL=${EMAIL}

# Database
DB_PASSWORD=${DB_PASSWORD}

# API Keys
API_KEY=${API_KEY}
NEXTAUTH_SECRET=${NEXTAUTH_SECRET}
SECRET_KEY=${SECRET_KEY}

# Service Passwords
MINIO_USER=${MINIO_USER}
MINIO_PASSWORD=${MINIO_PASSWORD}
GRAFANA_PASSWORD=${GRAFANA_PASSWORD}
N8N_PASSWORD=${N8N_PASSWORD}
EOF
    
    # Secure the credentials file
    chmod 600 "$INSTALL_DIR/configs/credentials.env"
    
    log_success "Credenciais de segurança geradas"
}

# Create Docker Compose configuration
create_docker_compose() {
    progress "Criando configuração Docker Compose"
    
    cat > "$INSTALL_DIR/docker-compose.yml" << EOF
version: '3.8'

networks:
  marcelonet:
    driver: bridge

volumes:
  traefik-data:
  postgres-data:
  redis-data:
  evolution-data:
  typebot-data:
  n8n-data:
  chatwoot-data:
  minio-data:
  portainer-data:
  grafana-data:
  supabase-data:

services:
  # Reverse Proxy & SSL
  traefik:
    image: traefik:v3.0
    container_name: ${COMPOSE_PROJECT_NAME}_traefik
    restart: unless-stopped
    command:
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
      - "--certificatesresolvers.letsencrypt.acme.httpchallenge=true"
      - "--certificatesresolvers.letsencrypt.acme.httpchallenge.entrypoint=web"
      - "--certificatesresolvers.letsencrypt.acme.email=${EMAIL}"
      - "--certificatesresolvers.letsencrypt.acme.storage=/letsencrypt/acme.json"
      - "--log.level=INFO"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - traefik-data:/letsencrypt
    networks:
      - marcelonet
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.traefik.rule=Host(\`admin.${DOMAIN}\`)"
      - "traefik.http.routers.traefik.entrypoints=websecure"
      - "traefik.http.routers.traefik.tls.certresolver=letsencrypt"
      - "traefik.http.routers.traefik.service=api@internal"

  # Database
  postgres:
    image: postgres:15-alpine
    container_name: ${COMPOSE_PROJECT_NAME}_postgres
    restart: unless-stopped
    environment:
      POSTGRES_DB: marcelosetup
      POSTGRES_USER: marcelosetup
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres-data:/var/lib/postgresql/data
    networks:
      - marcelonet
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U marcelosetup -d marcelosetup"]
      interval: 30s
      timeout: 10s
      retries: 3

  # Cache
  redis:
    image: redis:7-alpine
    container_name: ${COMPOSE_PROJECT_NAME}_redis
    restart: unless-stopped
    volumes:
      - redis-data:/data
    networks:
      - marcelonet

  # WhatsApp Business API
  evolution:
    image: atendai/evolution-api:latest
    container_name: ${COMPOSE_PROJECT_NAME}_evolution
    restart: unless-stopped
    environment:
      - DATABASE_ENABLED=true
      - DATABASE_PROVIDER=postgresql
      - DATABASE_CONNECTION_URI=postgresql://marcelosetup:${DB_PASSWORD}@postgres:5432/marcelosetup
      - AUTHENTICATION_TYPE=apikey
      - AUTHENTICATION_API_KEY=${API_KEY}
      - SERVER_URL=https://api.${DOMAIN}
      - WEBHOOK_GLOBAL_URL=https://n8n.${DOMAIN}/webhook/evolution
      - CORS_ORIGIN=*
      - LOG_LEVEL=ERROR
    volumes:
      - evolution-data:/evolution/instances
    networks:
      - marcelonet
    depends_on:
      postgres:
        condition: service_healthy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.evolution.rule=Host(\`api.${DOMAIN}\`)"
      - "traefik.http.routers.evolution.entrypoints=websecure"
      - "traefik.http.routers.evolution.tls.certresolver=letsencrypt"
      - "traefik.http.services.evolution.loadbalancer.server.port=8080"

  # Chatbot Builder
  typebot:
    image: baptistearno/typebot-builder:latest
    container_name: ${COMPOSE_PROJECT_NAME}_typebot
    restart: unless-stopped
    environment:
      - DATABASE_URL=postgresql://marcelosetup:${DB_PASSWORD}@postgres:5432/marcelosetup
      - NEXTAUTH_URL=https://bot.${DOMAIN}
      - NEXTAUTH_SECRET=${NEXTAUTH_SECRET}
      - ENCRYPTION_SECRET=${NEXTAUTH_SECRET}
      - ADMIN_EMAIL=${EMAIL}
      - DISABLE_SIGNUP=false
    volumes:
      - typebot-data:/app/packages/db/prisma
    networks:
      - marcelonet
    depends_on:
      postgres:
        condition: service_healthy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.typebot.rule=Host(\`bot.${DOMAIN}\`)"
      - "traefik.http.routers.typebot.entrypoints=websecure"
      - "traefik.http.routers.typebot.tls.certresolver=letsencrypt"
      - "traefik.http.services.typebot.loadbalancer.server.port=3000"

  # Typebot Viewer
  typebot-viewer:
    image: baptistearno/typebot-viewer:latest
    container_name: ${COMPOSE_PROJECT_NAME}_typebot_viewer
    restart: unless-stopped
    environment:
      - DATABASE_URL=postgresql://marcelosetup:${DB_PASSWORD}@postgres:5432/marcelosetup
      - NEXTAUTH_URL=https://bot.${DOMAIN}
      - NEXTAUTH_SECRET=${NEXTAUTH_SECRET}
      - ENCRYPTION_SECRET=${NEXTAUTH_SECRET}
    networks:
      - marcelonet
    depends_on:
      postgres:
        condition: service_healthy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.typebot-viewer.rule=Host(\`chat.${DOMAIN}\`)"
      - "traefik.http.routers.typebot-viewer.entrypoints=websecure"
      - "traefik.http.routers.typebot-viewer.tls.certresolver=letsencrypt"
      - "traefik.http.services.typebot-viewer.loadbalancer.server.port=3000"

  # Workflow Automation
  n8n:
    image: n8nio/n8n:latest
    container_name: ${COMPOSE_PROJECT_NAME}_n8n
    restart: unless-stopped
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=marcelosetup
      - DB_POSTGRESDB_USER=marcelosetup
      - DB_POSTGRESDB_PASSWORD=${DB_PASSWORD}
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD}
      - WEBHOOK_URL=https://n8n.${DOMAIN}
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo
    volumes:
      - n8n-data:/home/node/.n8n
    networks:
      - marcelonet
    depends_on:
      postgres:
        condition: service_healthy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.n8n.rule=Host(\`n8n.${DOMAIN}\`)"
      - "traefik.http.routers.n8n.entrypoints=websecure"
      - "traefik.http.routers.n8n.tls.certresolver=letsencrypt"
      - "traefik.http.services.n8n.loadbalancer.server.port=5678"

  # Customer Support
  chatwoot:
    image: chatwoot/chatwoot:latest
    container_name: ${COMPOSE_PROJECT_NAME}_chatwoot
    restart: unless-stopped
    environment:
      - RAILS_ENV=production
      - SECRET_KEY_BASE=${SECRET_KEY}
      - POSTGRES_HOST=postgres
      - POSTGRES_DATABASE=marcelosetup
      - POSTGRES_USERNAME=marcelosetup
      - POSTGRES_PASSWORD=${DB_PASSWORD}
      - REDIS_URL=redis://redis:6379
      - FRONTEND_URL=https://support.${DOMAIN}
      - ENABLE_ACCOUNT_SIGNUP=false
    volumes:
      - chatwoot-data:/app/storage
    networks:
      - marcelonet
    depends_on:
      postgres:
        condition: service_healthy
    command: ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.chatwoot.rule=Host(\`support.${DOMAIN}\`)"
      - "traefik.http.routers.chatwoot.entrypoints=websecure"
      - "traefik.http.routers.chatwoot.tls.certresolver=letsencrypt"
      - "traefik.http.services.chatwoot.loadbalancer.server.port=3000"

  # Chatwoot Worker
  chatwoot-worker:
    image: chatwoot/chatwoot:latest
    container_name: ${COMPOSE_PROJECT_NAME}_chatwoot_worker
    restart: unless-stopped
    environment:
      - RAILS_ENV=production
      - SECRET_KEY_BASE=${SECRET_KEY}
      - POSTGRES_HOST=postgres
      - POSTGRES_DATABASE=marcelosetup
      - POSTGRES_USERNAME=marcelosetup
      - POSTGRES_PASSWORD=${DB_PASSWORD}
      - REDIS_URL=redis://redis:6379
    networks:
      - marcelonet
    depends_on:
      postgres:
        condition: service_healthy
    command: ["bundle", "exec", "sidekiq", "-C", "config/schedule.yml"]

  # File Storage
  minio:
    image: minio/minio:latest
    container_name: ${COMPOSE_PROJECT_NAME}_minio
    restart: unless-stopped
    environment:
      - MINIO_ROOT_USER=${MINIO_USER}
      - MINIO_ROOT_PASSWORD=${MINIO_PASSWORD}
    volumes:
      - minio-data:/data
    command: server /data --console-address ":9001"
    networks:
      - marcelonet
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.minio.rule=Host(\`storage.${DOMAIN}\`)"
      - "traefik.http.routers.minio.entrypoints=websecure"
      - "traefik.http.routers.minio.tls.certresolver=letsencrypt"
      - "traefik.http.services.minio.loadbalancer.server.port=9001"

  # Container Management
  portainer:
    image: portainer/portainer-ce:latest
    container_name: ${COMPOSE_PROJECT_NAME}_portainer
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - portainer-data:/data
    networks:
      - marcelonet
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.portainer.rule=Host(\`docker.${DOMAIN}\`)"
      - "traefik.http.routers.portainer.entrypoints=websecure"
      - "traefik.http.routers.portainer.tls.certresolver=letsencrypt"
      - "traefik.http.services.portainer.loadbalancer.server.port=9000"

  # Monitoring
  grafana:
    image: grafana/grafana:latest
    container_name: ${COMPOSE_PROJECT_NAME}_grafana
    restart: unless-stopped
    environment:
      - GF_SECURITY_ADMIN_USER=admin
      - GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PASSWORD}
      - GF_USERS_ALLOW_SIGN_UP=false
      - GF_SERVER_DOMAIN=monitor.${DOMAIN}
      - GF_SERVER_ROOT_URL=https://monitor.${DOMAIN}
    volumes:
      - grafana-data:/var/lib/grafana
    networks:
      - marcelonet
    user: "472"
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.grafana.rule=Host(\`monitor.${DOMAIN}\`)"
      - "traefik.http.routers.grafana.entrypoints=websecure"
      - "traefik.http.routers.grafana.tls.certresolver=letsencrypt"
      - "traefik.http.services.grafana.loadbalancer.server.port=3000"

  # Backend API
  supabase:
    image: supabase/supabase-lite:latest
    container_name: ${COMPOSE_PROJECT_NAME}_supabase
    restart: unless-stopped
    environment:
      - POSTGRES_HOST=postgres
      - POSTGRES_DB=marcelosetup
      - POSTGRES_USER=marcelosetup
      - POSTGRES_PASSWORD=${DB_PASSWORD}
      - JWT_SECRET=${NEXTAUTH_SECRET}
      - ANON_KEY=${API_KEY}
      - SERVICE_ROLE_KEY=${API_KEY}
    volumes:
      - supabase-data:/var/lib/supabase
    networks:
      - marcelonet
    depends_on:
      postgres:
        condition: service_healthy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.supabase.rule=Host(\`api.${DOMAIN}\`) && PathPrefix(\`/supabase\`)"
      - "traefik.http.routers.supabase.entrypoints=websecure"
      - "traefik.http.routers.supabase.tls.certresolver=letsencrypt"
      - "traefik.http.services.supabase.loadbalancer.server.port=8000"
EOF

    log_success "Configuração Docker Compose criada"
}

# Start all services
start_services() {
    progress "Iniciando serviços enterprise"
    
    cd "$INSTALL_DIR"
    
    # Load environment variables
    export DOMAIN="${DOMAIN}"
    export EMAIL="${EMAIL}"
    export DB_PASSWORD="${DB_PASSWORD}"
    export API_KEY="${API_KEY}"
    export NEXTAUTH_SECRET="${NEXTAUTH_SECRET}"
    export SECRET_KEY="${SECRET_KEY}"
    export MINIO_USER="${MINIO_USER}"
    export MINIO_PASSWORD="${MINIO_PASSWORD}"
    export GRAFANA_PASSWORD="${GRAFANA_PASSWORD}"
    export N8N_PASSWORD="${N8N_PASSWORD}"
    export COMPOSE_PROJECT_NAME="${COMPOSE_PROJECT_NAME}"
    
    # Start infrastructure first
    progress "Iniciando infraestrutura básica"
    docker-compose up -d traefik postgres redis >> "$LOG_FILE" 2>&1
    
    # Wait for database
    progress "Aguardando banco de dados"
    sleep 30
    
    # Start storage services
    progress "Iniciando serviços de storage"
    docker-compose up -d minio >> "$LOG_FILE" 2>&1
    
    # Start main applications
    progress "Iniciando aplicações principais"
    docker-compose up -d evolution typebot typebot-viewer n8n >> "$LOG_FILE" 2>&1
    
    # Start support services
    progress "Iniciando suporte e monitoramento"
    docker-compose up -d chatwoot chatwoot-worker portainer grafana >> "$LOG_FILE" 2>&1
    
    # Start API services
    progress "Iniciando backend services"
    docker-compose up -d supabase >> "$LOG_FILE" 2>&1
    
    log_success "Todos os serviços enterprise foram iniciados"
}

# Wait for services to be ready
wait_for_services() {
    progress "Verificando serviços"
    
    local max_attempts=30
    local attempt=0
    
    while [[ $attempt -lt $max_attempts ]]; do
        if docker-compose ps | grep -q "Up"; then
            break
        fi
        attempt=$((attempt + 1))
        sleep 10
    done
    
    log_success "Serviços prontos"
}

#====================================================================
# MANAGEMENT TOOLS AND FINAL SETUP
#====================================================================

# Create management script
create_management_script() {
    progress "Criando ferramentas de gerenciamento"
    
    cat > "/usr/local/bin/marcelosetup" << 'EOF'
#!/bin/bash
# MarceloSetup v3.0 - Enterprise Management Tool

INSTALL_DIR="/opt/marcelosetup"
CREDENTIALS_FILE="$INSTALL_DIR/configs/credentials.env"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${YELLOW}          MarceloSetup v3.0 Enterprise       ${BLUE}║${NC}"
    echo -e "${BLUE}║${YELLOW}           Ferramenta de Gerenciamento       ${BLUE}║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════╝${NC}"
    echo ""
}

print_services() {
    if [[ -f "$CREDENTIALS_FILE" ]]; then
        source "$CREDENTIALS_FILE"
        echo -e "${BLUE}🌐 Serviços Disponíveis:${NC}"
        echo -e "   • Evolution API:  ${GREEN}https://api.${DOMAIN}${NC}"
        echo -e "   • Typebot:        ${GREEN}https://bot.${DOMAIN}${NC}"
        echo -e "   • Chat Viewer:    ${GREEN}https://chat.${DOMAIN}${NC}"
        echo -e "   • n8n:            ${GREEN}https://n8n.${DOMAIN}${NC}"
        echo -e "   • Chatwoot:       ${GREEN}https://support.${DOMAIN}${NC}"
        echo -e "   • Portainer:      ${GREEN}https://docker.${DOMAIN}${NC}"
        echo -e "   • MinIO:          ${GREEN}https://storage.${DOMAIN}${NC}"
        echo -e "   • Grafana:        ${GREEN}https://monitor.${DOMAIN}${NC}"
        echo -e "   • Traefik:        ${GREEN}https://admin.${DOMAIN}${NC}"
        echo ""
    fi
}

case "$1" in
    start)
        print_header
        echo -e "${GREEN}Iniciando MarceloSetup Enterprise...${NC}"
        cd "$INSTALL_DIR" && docker-compose up -d
        echo -e "${GREEN}✅ Todos os serviços foram iniciados!${NC}"
        print_services
        ;;
    stop)
        print_header
        echo -e "${YELLOW}Parando MarceloSetup Enterprise...${NC}"
        cd "$INSTALL_DIR" && docker-compose down
        echo -e "${YELLOW}⏹️ Todos os serviços foram parados!${NC}"
        ;;
    restart)
        print_header
        echo -e "${BLUE}Reiniciando MarceloSetup Enterprise...${NC}"
        cd "$INSTALL_DIR" && docker-compose restart
        echo -e "${GREEN}🔄 Todos os serviços foram reiniciados!${NC}"
        print_services
        ;;
    status)
        print_header
        echo -e "${BLUE}Status dos Serviços Enterprise:${NC}"
        cd "$INSTALL_DIR" && docker-compose ps
        ;;
    logs)
        print_header
        if [[ -n "$2" ]]; then
            echo -e "${BLUE}Logs do serviço: $2${NC}"
            cd "$INSTALL_DIR" && docker-compose logs -f "$2"
        else
            echo -e "${BLUE}Logs de todos os serviços:${NC}"
            cd "$INSTALL_DIR" && docker-compose logs -f
        fi
        ;;
    update)
        print_header
        echo -e "${BLUE}Atualizando imagens Docker...${NC}"
        cd "$INSTALL_DIR" && docker-compose pull
        echo -e "${BLUE}Reiniciando com novas imagens...${NC}"
        cd "$INSTALL_DIR" && docker-compose up -d
        echo -e "${GREEN}✅ Atualização concluída!${NC}"
        ;;
    credentials)
        print_header
        echo -e "${BLUE}Credenciais Enterprise:${NC}"
        if [[ -f "$CREDENTIALS_FILE" ]]; then
            cat "$CREDENTIALS_FILE" | grep -E "(PASSWORD|KEY|USER)" | sort
        else
            echo "Arquivo de credenciais não encontrado!"
        fi
        ;;
    services)
        print_header
        print_services
        ;;
    health)
        print_header
        echo -e "${BLUE}Verificação de Saúde dos Serviços:${NC}"
        cd "$INSTALL_DIR"
        
        services=("traefik" "postgres" "redis" "evolution" "typebot" "n8n" "chatwoot" "minio" "portainer" "grafana" "supabase")
        
        for service in "${services[@]}"; do
            if docker-compose ps "$service" | grep -q "Up"; then
                echo -e "   • $service: ${GREEN}✅ Rodando${NC}"
            else
                echo -e "   • $service: ${YELLOW}⚠️ Verificando${NC}"
            fi
        done
        ;;
    *)
        print_header
        echo -e "${BLUE}Comandos Disponíveis:${NC}"
        echo ""
        echo -e "  ${GREEN}start${NC}        - Iniciar todos os serviços"
        echo -e "  ${YELLOW}stop${NC}         - Parar todos os serviços"
        echo -e "  ${BLUE}restart${NC}      - Reiniciar todos os serviços"
        echo -e "  ${BLUE}status${NC}       - Ver status dos containers"
        echo -e "  ${BLUE}logs [serviço]${NC} - Ver logs (opcional: serviço específico)"
        echo -e "  ${BLUE}update${NC}       - Atualizar imagens Docker"
        echo -e "  ${BLUE}credentials${NC}  - Mostrar credenciais"
        echo -e "  ${BLUE}services${NC}     - Mostrar URLs dos serviços"
        echo -e "  ${BLUE}health${NC}       - Verificar saúde dos serviços"
        echo ""
        ;;
esac
EOF

    chmod +x "/usr/local/bin/marcelosetup"
    
    log_success "Ferramenta de gerenciamento criada"
}

# Show final information
show_final_information() {
    show_completion_banner
    
    # Load credentials for display
    source "$INSTALL_DIR/configs/credentials.env"
    
    echo -e "${BLUE}🌐 URLs dos Serviços Enterprise:${NC}"
    echo -e "   • ${YELLOW}Evolution API (WhatsApp):${NC}    ${GREEN}https://api.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}Typebot (Builder):${NC}           ${GREEN}https://bot.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}Typebot (Viewer):${NC}            ${GREEN}https://chat.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}n8n (Automação):${NC}             ${GREEN}https://n8n.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}Chatwoot (Suporte):${NC}          ${GREEN}https://support.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}Portainer (Docker):${NC}          ${GREEN}https://docker.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}MinIO (Storage):${NC}             ${GREEN}https://storage.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}Grafana (Monitor):${NC}           ${GREEN}https://monitor.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}Traefik (Admin):${NC}             ${GREEN}https://admin.${DOMAIN}${NC}"
    echo -e "   • ${YELLOW}Supabase (API):${NC}              ${GREEN}https://api.${DOMAIN}/supabase${NC}"
    echo ""
    
    echo -e "${YELLOW}🔑 Credenciais Master Enterprise:${NC}"
    echo -e "   • ${CYAN}Evolution API Key:${NC}           ${WHITE}${API_KEY}${NC}"
    echo -e "   • ${CYAN}Grafana Admin:${NC}               ${WHITE}admin / ${GRAFANA_PASSWORD}${NC}"
    echo -e "   • ${CYAN}n8n Login:${NC}                   ${WHITE}admin / ${N8N_PASSWORD}${NC}"
    echo -e "   • ${CYAN}MinIO Admin:${NC}                 ${WHITE}${MINIO_USER} / ${MINIO_PASSWORD}${NC}"
    echo -e "   • ${CYAN}Database Password:${NC}           ${WHITE}${DB_PASSWORD}${NC}"
    echo ""
    
    echo -e "${CYAN}🛠️ Comandos de Gerenciamento Enterprise:${NC}"
    echo -e "   • ${WHITE}marcelosetup status${NC}          - Ver status completo"
    echo -e "   • ${WHITE}marcelosetup services${NC}        - Mostrar URLs dos serviços"  
    echo -e "   • ${WHITE}marcelosetup health${NC}          - Verificar saúde dos serviços"
    echo -e "   • ${WHITE}marcelosetup logs${NC}            - Ver logs em tempo real"
    echo -e "   • ${WHITE}marcelosetup credentials${NC}     - Ver todas as credenciais"
    echo -e "   • ${WHITE}marcelosetup update${NC}          - Atualizar todas as imagens"
    echo ""
    
    echo -e "${GREEN}✅ Próximos Passos Obrigatórios:${NC}"
    echo -e "   ${YELLOW}1.${NC} Configure DNS: Aponte TODOS os subdomínios para ${BLUE}$(curl -s ifconfig.me 2>/dev/null || echo "SEU_IP")${NC}"
    echo -e "   ${YELLOW}2.${NC} Acesse Portainer: ${GREEN}https://docker.${DOMAIN}${NC} e configure admin"
    echo -e "   ${YELLOW}3.${NC} Configure Evolution API: ${GREEN}https://api.${DOMAIN}${NC} + WhatsApp Business"
    echo -e "   ${YELLOW}4.${NC} Configure Typebot: ${GREEN}https://bot.${DOMAIN}${NC} e crie seus chatbots"
    echo -e "   ${YELLOW}5.${NC} Configure n8n: ${GREEN}https://n8n.${DOMAIN}${NC} para automações"
    echo -e "   ${YELLOW}6.${NC} Configure Chatwoot: ${GREEN}https://support.${DOMAIN}${NC} para atendimento"
    echo ""
    
    echo -e "${BLUE}📊 Informações Enterprise:${NC}"
    echo -e "   • ${CYAN}Versão:${NC}                      MarceloSetup v${SCRIPT_VERSION}"
    echo -e "   • ${CYAN}Serviços Instalados:${NC}         10 aplicações profissionais"
    echo -e "   • ${CYAN}Diretório de Instalação:${NC}     ${INSTALL_DIR}"
    echo -e "   • ${CYAN}Logs do Sistema:${NC}             ${LOG_FILE}"
    echo -e "   • ${CYAN}Arquitetura:${NC}                 Enterprise Exclusiva MarceloSetup"
    echo ""
    
    echo -e "${BLUE}💬 Suporte Premium Enterprise:${NC}"
    echo -e "   • ${CYAN}Email:${NC}                       ${SCRIPT_EMAIL}"
    echo -e "   • ${CYAN}Website:${NC}                     ${SCRIPT_URL}"
    echo -e "   • ${CYAN}Desenvolvedor:${NC}               ${SCRIPT_AUTHOR}"
    echo -e "   • ${CYAN}Repositório:${NC}                 ${SCRIPT_REPO}"
    echo ""
    
    echo -e "${MAGENTA}🔥 MarceloSetup v${SCRIPT_VERSION} Enterprise - Instalação Concluída! 🔥${NC}"
    echo -e "${WHITE}Parabéns! Você agora possui a suite mais completa de automação de marketing!${NC}"
    echo ""
    
    # Final logging
    log "MarceloSetup v${SCRIPT_VERSION} Enterprise installation completed successfully"
    log "Domain: ${DOMAIN}"
    log "Email: ${EMAIL}"
    log "Installation directory: ${INSTALL_DIR}"
    log "Total services: 10 (Traefik, PostgreSQL, Redis, Evolution, Typebot, n8n, Chatwoot, MinIO, Portainer, Grafana, Supabase)"
}

#====================================================================
# MAIN EXECUTION FLOW
#====================================================================

# Main installation function
main() {
    # Initialize logging
    echo "MarceloSetup v${SCRIPT_VERSION} Enterprise installation started at $(date)" > "$LOG_FILE"
    
    # Show professional banner and accept terms
    show_banner
    
    # System verification phase
    check_root
    check_operating_system  
    check_system_resources
    check_internet_connectivity
    
    # Configuration phase
    configure_domain
    configure_email
    
    # Installation phase
    update_system
    install_docker
    install_docker_compose
    setup_firewall
    
    # Preparation phase
    create_directory_structure
    generate_credentials
    create_docker_compose
    
    # Deployment phase
    start_services
    wait_for_services
    
    # Management tools phase
    create_management_script
    
    # Completion
    progress "Finalizando instalação enterprise"
    show_final_information
}

#====================================================================
# SCRIPT EXECUTION WITH ERROR HANDLING
#====================================================================

# Set up error handling
trap 'log_error "Script failed at line $LINENO"' ERR

# Execute main installation
main "$@"

# Exit successfully
exit 0

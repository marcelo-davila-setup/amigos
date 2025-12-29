# 🤝 Contributing to MarceloSetup v3.0

Thank you for your interest in contributing to **MarceloSetup v3.0 Enterprise**! This document provides guidelines for contributing to this project.

## 📋 Table of Contents
- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Submission Process](#submission-process)

## 🤝 Code of Conduct

### Our Pledge
We are committed to making participation in this project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, sex characteristics, gender identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards
Examples of behavior that contributes to creating a positive environment include:
- ✅ Using welcoming and inclusive language
- ✅ Being respectful of differing viewpoints and experiences
- ✅ Gracefully accepting constructive criticism
- ✅ Focusing on what is best for the community
- ✅ Showing empathy towards other community members

## 🚀 Getting Started

### Prerequisites
- **Operating System:** Ubuntu 20.04+ or Debian 11+
- **Development Tools:** Git, Docker, Docker Compose
- **Text Editor:** VS Code, Vim, or your preferred editor
- **Testing Environment:** Clean Ubuntu/Debian VPS or VM

### Fork and Clone
```bash
# Fork the repository on GitHub
# Clone your fork
git clone https://github.com/YOUR_USERNAME/amigos.git
cd amigos

# Add upstream remote
git remote add upstream https://github.com/marcelo-davila-setup/amigos.git
```

## 🛠️ How to Contribute

### Types of Contributions
We welcome several types of contributions:

#### 🐛 Bug Reports
- Use GitHub Issues with the "bug" label
- Include detailed reproduction steps
- Provide system information (OS, Docker version, etc.)
- Include relevant log outputs

#### ✨ Feature Requests
- Use GitHub Issues with the "enhancement" label
- Clearly describe the proposed feature
- Explain the use case and benefits
- Consider backward compatibility

#### 📚 Documentation Improvements
- Fix typos and grammatical errors
- Improve clarity and completeness
- Add examples and use cases
- Update outdated information

#### 🔧 Code Contributions
- Bug fixes and improvements
- New service integrations
- Performance optimizations
- Security enhancements

## 💻 Development Setup

### Local Development Environment

```bash
# Clone the repository
git clone https://github.com/marcelo-davila-setup/amigos.git
cd amigos

# Create a development branch
git checkout -b feature/your-feature-name

# Test the script in a clean environment
# IMPORTANT: Always test on a disposable VPS/VM
```

### Testing Environment Setup

```bash
# Create a test Ubuntu VM or VPS
# Recommended: DigitalOcean, Linode, or local VirtualBox

# Test the installation script
bash marcelosetup.sh

# Verify all services are working
marcelosetup health
marcelosetup status
```

## 📝 Coding Standards

### Shell Script Guidelines

#### ✅ Best Practices
```bash
# Use strict mode
set -euo pipefail

# Function naming: lowercase with underscores
function install_docker() {
    # Function content
}

# Variable naming: UPPERCASE for globals, lowercase for locals
GLOBAL_VARIABLE="value"
local_variable="value"

# Always quote variables
echo "${VARIABLE}"
echo "$local_variable"

# Use [[ ]] for conditions
if [[ -f "$file" ]]; then
    # Action
fi
```

#### 🔧 Code Structure
- **Comments:** Explain complex logic and important sections
- **Error Handling:** Use proper error checking and meaningful messages
- **Logging:** Use the established logging functions (log_success, log_error, etc.)
- **Progress:** Update progress indicators for long operations

#### 🎨 Formatting
```bash
# Function header example
#====================================================================
# FUNCTION: install_service
# DESCRIPTION: Installs and configures a specific service
# PARAMETERS: $1 - service name, $2 - service version
# RETURNS: 0 on success, 1 on failure
#====================================================================
install_service() {
    local service_name="$1"
    local service_version="$2"
    
    # Function implementation
}
```

### Docker Compose Standards

#### ✅ Service Configuration
```yaml
services:
  service-name:
    image: service:latest
    container_name: ${COMPOSE_PROJECT_NAME}_service_name
    restart: unless-stopped
    environment:
      - VARIABLE=value
    volumes:
      - service-data:/data
    networks:
      - marcelonet
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.service.rule=Host(`service.${DOMAIN}`)"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:port/health"]
      interval: 30s
      timeout: 10s
      retries: 3
```

## 🧪 Testing Guidelines

### Testing Requirements
- **Always test on clean Ubuntu/Debian systems**
- **Test with minimum and recommended system requirements**
- **Verify all services start correctly**
- **Test SSL certificate generation**
- **Validate all subdomains are accessible**

### Testing Checklist
```bash
# System validation
✅ OS compatibility check
✅ Resource requirements validation
✅ Internet connectivity test

# Installation process
✅ Dependency installation
✅ Docker and Docker Compose setup
✅ Service deployment
✅ SSL certificate generation

# Service validation
✅ All containers are running
✅ Health checks pass
✅ Web interfaces accessible
✅ SSL certificates valid

# Management tools
✅ CLI commands work correctly
✅ Backup functionality
✅ Service restart capability
```

### Performance Testing
- Monitor resource usage during installation
- Verify startup times for all services
- Test under different system configurations
- Validate memory and disk usage

## 📤 Submission Process

### Pull Request Guidelines

#### 1. 🌿 Create Feature Branch
```bash
git checkout -b feature/descriptive-name
# or
git checkout -b bugfix/issue-description
# or
git checkout -b docs/improvement-description
```

#### 2. 🔨 Make Changes
- Follow coding standards
- Add appropriate comments
- Update documentation if needed
- Test thoroughly

#### 3. 📝 Commit Messages
```bash
# Good commit messages
git commit -m "feat: add support for custom SSL certificates"
git commit -m "fix: resolve container startup race condition"
git commit -m "docs: improve installation troubleshooting guide"

# Commit message format
type(scope): description

# Types: feat, fix, docs, style, refactor, test, chore
```

#### 4. 🧪 Test Your Changes
```bash
# Test on clean system
# Verify all functionality works
# Check for any regressions
```

#### 5. 📤 Submit Pull Request
- Clear description of changes
- Reference any related issues
- Include testing information
- Screenshots for UI changes

### Pull Request Template
```markdown
## Description
Brief description of changes made

## Type of Change
- [ ] Bug fix (non-breaking change that fixes an issue)
- [ ] New feature (non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that causes existing functionality to change)
- [ ] Documentation update

## Testing
- [ ] Tested on Ubuntu 20.04
- [ ] Tested on Ubuntu 22.04
- [ ] Tested with minimum system requirements
- [ ] Tested with recommended system requirements
- [ ] All services start successfully
- [ ] SSL certificates generate correctly

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Changes are documented
- [ ] No new warnings introduced
```

## 🔍 Review Process

### Review Criteria
- **Functionality:** Does it work as intended?
- **Security:** Are there any security implications?
- **Performance:** Does it impact system performance?
- **Compatibility:** Works with supported systems?
- **Documentation:** Is it properly documented?

### Review Timeline
- Initial review within 48 hours
- Feedback provided within 72 hours
- Final approval within 1 week (for complex changes)

## 🆘 Getting Help

### Support Channels
- **GitHub Issues:** For bugs and feature requests
- **Email:** info@marceloautomacoes.com.br
- **Documentation:** Check README.md and CHANGELOG.md

### Development Questions
- Create a discussion in GitHub Discussions
- Use descriptive titles
- Provide context and code examples
- Be respectful and patient

## 🏆 Recognition

Contributors will be recognized in:
- **CHANGELOG.md** for significant contributions
- **README.md** acknowledgments section
- **GitHub contributors** list

## 📄 License

By contributing to MarceloSetup v3.0, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to MarceloSetup v3.0 Enterprise! 🚀**

**Powered by [@marceloagentedigital](https://github.com/marceloagentedigital)**

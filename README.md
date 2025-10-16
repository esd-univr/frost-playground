# Frost Playground

A collection of example applications and experiments built with the [Frost framework](https://github.com/glacier-project/frost) for developing digital twins of industrial systems for testing, validation, and deployment of machine control software.

## About

This repository serves as a playground and learning resource for the Frost framework, demonstrating various patterns and use cases for building deterministic, event-driven applications using [Lingua Franca (LF)](https://www.lf-lang.org/).

Frost is an open-source framework focused on implementing unified and extensible interfaces for machine control software, enabling development and testing in virtual environments (Digital Twins) before deployment on actual machines. It's part of the [Glacier project](https://glacier-project.github.io/glacier-website/).

## Repository Structure

```
frost-playground/
├── src/                    # Example applications
│   ├── PublisherSubcriber.lf
│   ├── SensorAlarm.lf
│   ├── StockMarket.lf
│   ├── ProductionScheduler.lf
│   └── TargetInitiator.lf
├── frost/                 # Frost framework (submodule)
│   ├── src/lib/           # Core Frost components
│   ├── benchmark/         # Benchmark implementations
│   └── test/              # Test suite
├── resources/             # Configuration files
│   ├── frost_config.yml
│   └── data_model/        # YAML data models
└── .devcontainer/         # Development container setup
```

## Getting Started

### Prerequisites

- Python 3.12+
- Java 17+ (for Lingua Franca compiler)
- [Lingua Franca Compiler (lfc)](https://www.lf-lang.org/)

### Installation

1. **Clone the repository with submodules:**
   ```bash
   git clone --recurse-submodules https://github.com/esd-univr/frost-playground.git
   cd frost-playground
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Verify Lingua Franca compiler installation:**
   ```bash
   lfc --version
   ```

### Using DevContainer / GitHub Codespaces

The easiest way to get started is using the provided DevContainer configuration:

**With GitHub Codespaces (Recommended):**

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/esd-univr/frost-playground)

1. Click the badge above or the "Code" button on the GitHub repository
2. Select "Create codespace on main"
3. Wait for the container to build and initialize
4. The environment will automatically:
   - Pull the Frost submodule
   - Install all dependencies
   - Set up Lingua Franca compiler
   - Configure VS Code extensions

**With VS Code DevContainer (Local):**
1. Install [Docker](https://www.docker.com/) and the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Open the repository in VS Code
3. Click "Reopen in Container" when prompted (or use Command Palette: "Dev Containers: Reopen in Container")
4. The container will automatically initialize submodules and set up the environment

**With Docker (Manual):**
```bash
docker build -t frost-playground .
docker run -it frost-playground
```

## Example Applications

### Publisher-Subscriber Pattern
Demonstrates basic message passing using Frost's data model and bus system.

**File:** `src/PublisherSubcriber.lf`

### Sensor-Alarm System
A reactive system where sensors trigger alarms based on monitored conditions.

**File:** `src/SensorAlarm.lf`

### Stock Market Simulation
Multiple investors interacting with a shared stock market data model.

**File:** `src/StockMarket.lf`

### Production Scheduler
A scheduler coordinating multiple machines in a production line scenario.

**File:** `src/ProductionScheduler.lf`

### Target-Initiator Pattern
Demonstrates request-response patterns between components.

**File:** `src/TargetInitiator.lf`

## Building and Running Examples

To compile and run an example:

```bash
# Navigate to the project directory
cd frost-playground

# Compile an example (e.g., PublisherSubscriber)
lfc src/PublisherSubcriber.lf

# Run the compiled example
./bin/PublisherSubcriber
```

## Usefull Resources

- **Lingua Franca Documentation:** [lf-lang.org/docs](https://www.lf-lang.org/docs)
- **Glacier Project:** [glacier-project.github.io](https://glacier-project.github.io/glacier-website/)

## Contributing

Contributions are welcome! Feel free to:
- Add new examples
- Improve documentation
- Report issues
- Submit pull requests
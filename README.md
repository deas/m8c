# Provision private agile Silicon Mac OS for Deployment of AI- and LLM based Services

Companies should exercise "common sense": instead of signing expensive US subscriptions that harbor data protection risks, local private AI- and LLMs enable legally compliant, cost-effective, and high-performance use of AI directly on their own hardware.

## About The Project

- **Objective:** Provision private agile Silicon Mac OS for Deployment of AI- and LLM based Services
- **Target Audience:** Teams, Small Organisations and Individuals
- **Success Metrics:** [How do we know it works? To be defined]

### Architecture Overview

The Provisioning System supports local and remote execution over `ssh`.

The Machine is provisioned using `ansible` and `brew`. It covers application deployments and node configuration.

Operating System is Silicon Mac OS.

### Features

#### Local Automation & RAG

- **Goal:** Integrate AI models into automated workflows without data leaving your own infrastructure.
- **Benefit:** Automatic processing of files, emails, or database entries by local AI agents.
- **Function:** Connecting Ollama with the automation tool n8n to map complex workflows locally.

#### Local Voice Assistant (Voice Control & Transcription)

- **Goal:** A private voice assistant for dictating and controlling tasks.
- **Benefit:** More secure than cloud solutions like WhisperFlow, especially for those bound by professional secrecy (lawyers, doctors).
- **Function:** Using models like _Whisper_ or _Voxistral_ (Mistral) to convert speech into text locally and execute commands.

### List of Used Tools & Technologies

#### Infrastructure & Hosting

- **Ollama:** The core tool for running LLMs locally (Llama 3, Mistral, etc.).
- **Tailnet:** For secure and easy access to the local network from anywhere.
- **TDB:** Private model infrastructure on demand

#### User Interfaces & Management

#### Automation & AI Logic

- **OpenFang/Nanobot/ZeroClaw/...:** Personal AI Assistant
- **OpenCode:** Open Source Coding Agent

#### Models & Specialized Libraries

- **OpenRouter:**: The unified interface for connecting to various LLMs
- **Mistral / Voxistral:** European AI models for text and speech.
- **Whisper (OpenAI):** Model for speech recognition (implemented locally) serving Voxtype

#### Observability

#### Hardware Recommendations

- **Apple Silicon :** Particularly efficient for local AI.

### Getting Started

### Prerequisites

- `make`
- `bats`
- `shellcheck`
- `shfmt`

### Usage

There is a [`Makefile`](./Makefile) with various ad hoc tasks. Simply running

```sh
make
```

should give you some help.

## TODO

See the [open issues](https://github.com/deas/a1-infra/issues) for a full list of proposed features (and known issues).

## Known Issues

## References

## Contributing

Familiarize yourself with the details about [standards, conventions and rules](./AGENTS.md).

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

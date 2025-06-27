# zsh-predict

oh-my-zsh plugin using LLM to suggest/complete your current command.
Forked from [zsh-copilot](https://github.com/Gamma-Software/zsh-copilot) and modified to only do interactive prediction.

## Installation

### Prerequisites

- [`cURL`](https://curl.se/)
- [`jq`](https://stedolan.github.io/jq/)
- [OpenAI](https://platform.openai.com/account/api-keys) API key or openai compatible API key and base URL.

Quick install:
```bash
curl -sL https://raw.githubusercontent.com/urineri/zsh-predict/main/install.sh | bash
```
Otherwise, git clone the repo into your custom plugins directory, modify the `.env` file, and add `zsh-predict` to your plugins list.  
Note: you might need to disable compfix in your `.zshrc` file:  
```bash
ZSH_DISABLE_COMPFIX=true
```


## Usage
During your zsh session, invoke the prediction with the keyboard shortcut (default: `ctrl+t`).  
Accept the prediction with `enter`, or reject it with `exit` or `ctrl+c`.


## License

This project is licensed under [MIT license](http://opensource.org/licenses/MIT). For the full text of the license, see the [LICENSE](LICENSE) file.
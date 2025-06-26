# zsh-predict

oh-my-zsh plugin using LLM to suggest/complete your current command.
Forked from [zsh-copilot](https://github.com/Gamma-Software/zsh-copilot) and modified to only do interactive prediction.

## Installation

### Prerequisites

- [`cURL`](https://curl.se/)
- [`jq`](https://stedolan.github.io/jq/)
- [OpenAI](https://platform.openai.com/account/api-keys) API key or openai compatible API key and base URL.

```bash
mkdir ~/.oh-my-zsh/plugins/
cd ~/.oh-my-zsh/plugins/
git clone https://github.com/urineri/zsh-predict
```

Then edit the `~/.oh-my-zsh/plugins/zsh-predict/.env` file.  

Then modify `~/.zshrc` to add `zsh-predict` to plugins and disable compfix:

```bash
...
ZSH_DISABLE_COMPFIX=true
plugins=(
...
zsh-predict
...
)
```

## Usage
During your zsh session, invoke the prediction with the keyboard shortcut (default: `ctrl+space `).  
Accept the prediction with `enter`, or reject it with `exit` or `ctrl+c`.



## License

This project is licensed under [MIT license](http://opensource.org/licenses/MIT). For the full text of the license, see the [LICENSE](LICENSE) file.
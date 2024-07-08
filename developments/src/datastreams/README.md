## Chainlink Data Streams

#### Chainlink Data Streams provides low-latency delivery of market data offchain that you can verify onchain. With Chainlink Data Streams, decentralized applications (dApps) now have on-demand access to high-frequency market data backed by decentralized and transparent infrastructure.

### Use cases

#### Pull-based oracles allow decentralized applications to access data that is updated at a high frequency and delivered with low latency, which enables several new use cases:

- `Perpetual Futures:` Low-latency data and frontrunning prevention enable onchain perpetual futures protocols that can compete on performance with centralized exchanges while still using more transparent and decentralized infrastructure.
- `Options:` Pull-based oracles allow timely and precise settlement of options contracts. Additionally, Data Streams provides more detailed market liquidity data that can support dynamic onchain risk management logic.
- `Prediction Markets:` Higher frequency data updates allow for applications where users can act quickly in response to real-time events and be confident in the accuracy of the data used in the settlement.

Read more [data feeds](https://docs.chain.link/data-streams)

- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
- [Usage](#usage)
  - [Testing](#testing)
- [Thank you!](#thank-you)

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [Nodejs](https://nodejs.org/en/)
  - You'll know you've installed nodejs right if you can run:
    - `node --version` and get an ouput like: `vx.x.x`
- [Yarn](https://yarnpkg.com/getting-started/install) instead of `npm`
  - You'll know you've installed yarn right if you can run:
    - `yarn --version` and get an output like: `x.x.x`
    - You might need to [install it with `npm`](https://classic.yarnpkg.com/lang/en/docs/install/) or `corepack`

## Quickstart

```
git clone https://github.com/YourGuyD3v/ChainlinkPedia
cd ChainlinkPedia/developments
forge install
```

# Usage

## Testing

There is a contract named `GetETHPrice.sol` for demo and test contract `test/datafeeds/GetETHPrice.t.sol` for testing

for demo run this to get eth price

```
forge test --fork-url ${SEPOLIA_RPC_URL} -vvv
```

# Thank you!

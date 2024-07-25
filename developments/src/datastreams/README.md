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
    - [Before registering the upkeep](#before-registering-the-upkeep)
    - [Register the upkeep](#register-the-upkeep)
    - [After registering the upkeep](#after-registering-the-upkeep)
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

There is a contract named `CallMeOnChain` for demo and test contract `test/datafeeds/CallMeOnChain.t.sol` for testing

for demo run this to get eth price

Get testnet from here: [faucets](https://faucets.chain.link/)

Get RPC_URL from here: [Endpoint](https://dashboard.alchemy.com/)

Get Etherscan_API_KEY from here: [Etherscan](https://etherscan.io/myaccount)

```
forge script script/datastreams/CallMeOnChainS.s.sol:CallMeOnChainS --rpc-url ${process.env.RPC_URL} --private-key ${PRIVATE_KEY} --etherscan-api-key ${ETHERSCAN_API_KEY} --broadcast --verify --legacy
```

### Before registering the upkeep

Run this before Register the upkeep to see the `Counted()` function return:

```
cast call ${contract address} "counted()" --rpc-url ${RPC_URL}
```

Expected output:

```
0x0000000000000000000000000000000000000000000000000000000000000000
```

### Register the upkeep

Register a new Log trigger upkeep. See [Automation Log Triggers](https://docs.chain.link/chainlink-automation/guides/log-trigger) to learn more about how to register Log Trigger upkeeps.

1. Go to the [Chainlink Automation UI](https://automation.chain.link/arbitrum-sepolia) for Arbitrum Sepolia and connect your browser wallet.

2. Click Register new Upkeep.

3. Select the Log trigger upkeep type and click Next.

4. Specify the upkeep contract address you saved earlier as the Contract to automate. In this example, you can ignore the warning about the Automation compatible contract verification. Click Next.
   **_Note: For this use CountWithLog contract address._**

5. Specify the emitter contract address that you saved earlier. This tells Chainlink Automation what contracts to watch for log triggers. Then click Next.
   **_Note: For this use CallMeOnChain contract address._**

6. Provide the ABI if the contract is not validated. To find the ABI of your contract go to <mark>developments/out/CallMeOnChain.sol/CallMeOnChain.json</mark>

7. Select the Log event as the triggering event in the Emitted log dropdown. Log index topic filters are optional filters to narrow the logs you want to trigger your upkeep. For this example, leave the field blank. Click Next.

8. Specify a name for the upkeep.

9. Specify a Starting balance of 1 testnet LINK for this example. You can retrieve unused LINK later.

10. Leave the Check data value and other fields blank for now, and click Register Upkeep. MetaMask prompts you to confirm the transaction. Wait for the transaction to complete.

### After registering the upkeep

```
cast send ${contract address} "emitLog()" --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY}
```

Again call `counted()`, return output will be incremented

```
cast call ${contract address} "counted()" --rpc-url ${RPC_URL}
```

Expected output:

```
0x0000000000000000000000000000000000000000000000000000000000000001
```

# Thank you!

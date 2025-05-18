# Airlines and airports dashboard

The goal of this dashboard is to tell about US airlines and airports.

We want to answer questions with data such as:
- What airline is the most delayed / punctual?
- What airline/airport has the most amount of flights?
- What airline/airport has the most amount of cancellations?

![Airports page](/figures/airports-show.png)

![Airlines page](/figures/airlines-show.png)

The dashboard is built using [Evidence](https://evidence.dev/), a data exploration and visualization tool that uses SQL and Markdown for creating dashboards.


## Get Started from VS Code
The easiest way to get started is using the [VS Code Extension](https://marketplace.visualstudio.com/items?itemName=Evidence.evidence-vscode)

**Note:** Codespaces is much faster on the Desktop app. After the Codespace has booted, select the hamburger menu → Open in VS Code Desktop.

## Getting Started 

### Run Postgres container and load data

```bash
chmod +x init/restore.sh

docker-compose up --build
```

### Run Evidence Development Server

```bash
npm install
npm run sources
npm run dev
```
Then open [localhost:3000](http://localhost:3000) in your browser.

Note: it might take up to 30 mins to run npm install!


## Dataset

The dataset is from [Bureau of Transportation Statistics](https://www.transtats.bts.gov/OT_Delay/OT_DelayCause1.asp?pn=1) and contains information about flights in the US from 2016 to 2017.
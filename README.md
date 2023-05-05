# Lets Go!

Yeet Equalify to the world!

## Build Statuses
| System | Status |
| --- | --- |
| Uppies | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/integration-uppies/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/integration-uppies) |
| Rabbit Hole | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/rabbit-hole/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/rabbit-hole) |
| Matrix | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/a11ymatrix/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/a11ymatrix) |
| Axe | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/integration-axe/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/integration-axe) |
| A11ytheus | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/a11ytheus/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/a11ytheus) |
| Database | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/database/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/database) |
| A11yRabbit | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/a11y-rabbit/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/a11y-rabbit) |
| Grafana | [![🏗️📤 Build and publish 🐳 images](https://github.com/EqualifyApp/a11yfana/actions/workflows/containerize.yml/badge.svg)](https://github.com/EqualifyApp/a11yfana) |


## Docker

### Environment Variables

| Variable  | Default | Options          | Description                                 |
| --------- | ------- | :--------------- | :------------------------------------------ |
| SCAN_PORT | `8083`  | All Port Numbers | Port where the backend listens for requests |


## Installation

### Requirements

Equalify is built using several Docker containers. Lets Go! is the master build file. Running this will start up the other containers. 

- Docker 
- a valid WIREGUARD_PRIVATE_KEY

###

To Install Equalify
1. Clone this repository
`$ git clone https://github.com/EqualifyApp/lets-go.git`

2. Change to the ./docker container of the repository.
`$ cd lets-go/docker`

3. Edit the Docker yaml file to include the Wireguard Private Key.

4. Run Docker
`$ docker compose up`

## License

Coming soon. Quite likely the AGPL.

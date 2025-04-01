# Database Benchmarking Project

This project contains benchmarking configurations and setups for comparing different distributed database systems using BenchBase (formerly OLTPBench). The project includes configurations for:

- YugabyteDB
- TiDB
- SingleStore
- CockroachDB

## Project Structure

Each database has its own directory containing the necessary configuration files and Docker Compose setups for running the benchmarks:

```
.
├── cockroachdb/
├── singlestore/
├── tidb/
└── yugabyte/
    └── benchbase/
        ├── config/
        └── docker-compose.yml
```

## Prerequisites

- Docker
- Docker Compose
- BenchBase (included in the Docker setup)

## Getting Started

Each database directory contains its own Docker Compose configuration. To run benchmarks for a specific database:

1. Navigate to the desired database directory
2. Run the Docker Compose setup

For example, to run YugabyteDB benchmarks:

```bash
cd yugabyte/benchbase
docker-compose up
```

## Benchmark Configuration

The benchmarks are configured using XML configuration files located in the `config/` directory of each database setup. These configurations define:

- Database connection parameters
- Benchmark parameters
- Workload characteristics
- Transaction types and their weights

## Results

Benchmark results are stored in the `results/` directory within each database's setup. The results include:

- Throughput metrics
- Latency measurements
- Transaction success rates
- System resource utilization

## Contributing

Feel free to contribute to this project by:

1. Adding new database configurations
2. Improving existing benchmark configurations
3. Adding documentation
4. Reporting issues

## License

[Add your license information here]
# MASTER BUILD FRAMEWORK v1.1 — SEGMENT 2 of 4
## MBF_PART_2_DATA_AI
### Contents: Tier 3 (Cat 15-21) + Tier 4 (Cat 22-35)
### Lines: 1114-2243 of original
---
> **SEGMENT NAVIGATION:** This is a development segment. For full MBF, merge all 4 parts.
> For BRIDGE routing: Categories 15-35 are in this segment.
---

# TIER 3: DATA & PERSISTENCE
## *How Data Is Stored, Retrieved, and Managed*

---

## Category 15: Relational Databases

### Scope
SQL databases, PostgreSQL, MySQL, SQLite, transactional systems, migrations, ORMs.

### Technology Stack — Exhaustive

#### Database Engines
| Database | Best For |
|----------|----------|
| **PostgreSQL** | General purpose, extensions |
| **MySQL/MariaDB** | Web applications |
| **SQLite** | Embedded, local-first |
| **CockroachDB** | Distributed SQL |

#### Managed Services
| Service | Database |
|---------|----------|
| **Supabase** | PostgreSQL + backend |
| **Neon** | Serverless PostgreSQL |
| **PlanetScale** | Serverless MySQL |
| **AWS RDS** | Multiple |
| **Turso** | Distributed SQLite |

#### ORMs & Query Builders
| Tool | Language |
|------|----------|
| **Prisma** | TypeScript |
| **Drizzle** | TypeScript |
| **Kysely** | TypeScript |
| **SQLAlchemy** | Python |
| **GORM** | Go |

### Quality Gates

```
□ Indexes on foreign keys
□ Connection pooling configured
□ Query performance analyzed
□ N+1 queries eliminated
□ Migrations reversible
□ Backups automated
□ Replication configured (if needed)
□ Slow query logging enabled
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Data layer
- **→ Category 22** (Caching) — Query caching
- **→ Category 43** (DevOps) — Backup automation

---

## Category 16: Vector Databases & Semantic Search

### Scope
Embeddings storage, similarity search, RAG retrieval, recommendation systems.

### Technology Stack — Exhaustive

#### Vector Databases
| Database | Best For |
|----------|----------|
| **Qdrant** | Full-featured, filtering |
| **Pinecone** | Serverless, simple |
| **Weaviate** | GraphQL, multimodal |
| **Chroma** | Embedded, local |
| **pgvector** | Existing PostgreSQL |
| **LanceDB** | Embedded, serverless |

#### Embedding Models
| Provider | Models |
|----------|--------|
| **OpenAI** | text-embedding-3-* |
| **Cohere** | embed-v3 |
| **Voyage AI** | voyage-3, voyage-code |
| **BGE/E5** | Open-source |

#### Search Enhancement
| Technique | Tools |
|-----------|-------|
| **Hybrid Search** | BM25 + vector |
| **Re-ranking** | Cohere Rerank, BGE |
| **HyDE** | Query expansion |

### Quality Gates

```
□ Embedding model benchmarked
□ Chunk size optimized
□ Metadata schema defined
□ Recall measured
□ Re-ranking evaluated
□ Query latency profiled
□ Hybrid search tested
```

### Cross-Category Dependencies
- **→ Category 29-31** (AI) — RAG systems
- **→ Category 15** (Relational) — Metadata storage
- **→ Category 11** (GPU) — Embedding compute

---

## Category 17: Document & NoSQL Databases

### Scope
Document databases, key-value stores, graph databases, time-series.

### Technology Stack — Exhaustive

#### Document Databases
| Database | Best For |
|----------|----------|
| **MongoDB** | General document storage |
| **Firestore** | Firebase, real-time |
| **DynamoDB** | AWS serverless |

#### Graph Databases
| Database | Query Language |
|----------|---------------|
| **Neo4j** | Cypher |
| **Amazon Neptune** | Gremlin |
| **ArangoDB** | AQL (multi-model) |

#### Time-Series
| Database | Best For |
|----------|----------|
| **InfluxDB** | Metrics, IoT |
| **TimescaleDB** | PostgreSQL-based |
| **ClickHouse** | Analytics |

### Quality Gates

```
□ Data model matches access patterns
□ Indexes support all queries
□ Partition key chosen correctly
□ Replication configured
□ Backup strategy implemented
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Data layer
- **→ Category 22** (Caching) — Cache integration

---

## Category 18: Local-First & Offline Databases

### Scope
Client-side databases, offline-first, sync engines, CRDTs.

### Technology Stack — Exhaustive

#### Browser Databases
| Database | Type |
|----------|------|
| **IndexedDB** | Native browser |
| **Dexie.js** | IndexedDB wrapper |
| **SQLite WASM** | SQL in browser |
| **PouchDB** | CouchDB sync |

#### Sync Engines
| Engine | Approach |
|--------|----------|
| **PowerSync** | PostgreSQL sync |
| **ElectricSQL** | PostgreSQL sync |
| **Y.js** | CRDT |
| **Automerge** | CRDT |
| **Liveblocks** | Real-time sync |

### Quality Gates

```
□ Offline functionality tested
□ Sync conflicts handled
□ Storage limits understood
□ Migration strategy defined
□ Encryption at rest (if needed)
```

### Cross-Category Dependencies
- **→ Category 1-3** (Apps) — Client applications
- **→ Category 15** (Relational) — Server database
- **→ Category 24** (Real-time) — Sync layer

---

## Category 19: Object Storage & File Systems

### Scope
Cloud storage, file uploads, CDN for assets, presigned URLs.

### Technology Stack — Exhaustive

#### Cloud Object Storage
| Service | Best For |
|---------|----------|
| **Amazon S3** | Industry standard |
| **Cloudflare R2** | No egress fees |
| **Backblaze B2** | Cost-effective |
| **Supabase Storage** | Supabase integration |
| **Uploadthing** | Simple uploads |

#### File Processing
| Tool | Purpose |
|------|---------|
| **Sharp** | Image processing |
| **FFmpeg** | Video/audio |
| **Cloudinary** | CDN + processing |

### Quality Gates

```
□ Presigned URLs for uploads
□ File type validation
□ File size limits enforced
□ CDN configured
□ Lifecycle policies set
□ Encryption at rest
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Upload endpoints
- **→ Category 9** (Edge) — CDN delivery
- **→ Category 36-38** (Content) — Media processing

---

## Category 20: Data Warehousing & Analytics

### Scope
Analytics databases, OLAP, data lakes, ETL, business intelligence.

### Technology Stack — Exhaustive

#### Cloud Data Warehouses
| Warehouse | Best For |
|-----------|----------|
| **Snowflake** | Multi-cloud |
| **BigQuery** | Serverless, GCP |
| **Redshift** | AWS |
| **Databricks** | Lakehouse, ML |
| **ClickHouse** | Real-time analytics |
| **DuckDB** | Embedded OLAP |

#### ETL/ELT Tools
| Tool | Type |
|------|------|
| **dbt** | Transform (ELT) |
| **Airbyte** | Extract/Load |
| **Fivetran** | Managed EL |
| **Apache Airflow** | Orchestration |
| **Dagster** | Modern orchestration |

#### BI & Visualization
| Tool | Type |
|------|------|
| **Metabase** | Open-source BI |
| **Apache Superset** | Open-source BI |
| **Looker** | Google BI |

### Quality Gates

```
□ Data model documented
□ ETL jobs monitored
□ Data quality checks
□ Freshness SLAs defined
□ Access controls in place
```

### Cross-Category Dependencies
- **→ Category 15-17** (Databases) — Source systems
- **→ Category 44** (Workflows) — Orchestration
- **→ Category 49** (Dashboards) — Visualization

---

## Category 21: Search Engines

### Scope
Full-text search, faceted search, autocomplete, typo tolerance.

### Technology Stack — Exhaustive

#### Search Engines
| Engine | Best For |
|--------|----------|
| **Meilisearch** | Developer experience |
| **Typesense** | Typo-tolerance |
| **Algolia** | Speed, relevance |
| **Elasticsearch** | Enterprise, analytics |

#### Search UI
| Library | Framework |
|---------|-----------|
| **InstantSearch** | React, Vue |
| **DocSearch** | Documentation |

### Quality Gates

```
□ Relevance tested with real queries
□ Typo tolerance configured
□ Autocomplete latency <100ms
□ Search latency <200ms
□ Indexing pipeline reliable
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Search API
- **→ Category 16** (Vector) — Semantic search

---

# TIER 4: AI & AGENT SYSTEMS
## *Intelligence, Reasoning, and Autonomous Capability*

---

## Category 22: Caching & Performance

### Scope
In-memory caching, distributed caching, CDN caching, query caching.

### Technology Stack — Exhaustive

#### In-Memory Caches
| Cache | Best For |
|-------|----------|
| **Redis** | General purpose |
| **Upstash Redis** | Serverless |
| **Dragonfly** | High performance |
| **Momento** | Serverless |

#### Caching Patterns
| Pattern | Use Case |
|---------|----------|
| **Cache-Aside** | General caching |
| **Read-Through** | Simplified reads |
| **Write-Behind** | Performance |

### Quality Gates

```
□ Cache hit rate monitored
□ TTL values appropriate
□ Cache invalidation strategy
□ Connection pooling
□ Failover tested
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Response caching
- **→ Category 9** (Edge) — Edge caching
- **→ Category 15** (Databases) — Query caching

---

## Category 23: Message Queues & Event Streaming

### Scope
Async messaging, job queues, event-driven architecture, pub/sub.

### Technology Stack — Exhaustive

#### Message Queues
| Queue | Best For |
|-------|----------|
| **BullMQ** | Node.js jobs |
| **RabbitMQ** | Reliable messaging |
| **Amazon SQS** | AWS serverless |

#### Event Streaming
| Platform | Best For |
|----------|----------|
| **Apache Kafka** | High-throughput |
| **Redpanda** | Kafka-compatible |
| **NATS** | Lightweight |

#### Workflow Engines
| Tool | Type |
|------|------|
| **Temporal** | Durable execution |
| **Inngest** | Serverless workflows |
| **Trigger.dev** | Background jobs |

### Quality Gates

```
□ Message durability configured
□ Dead letter queues set up
□ Retry policies defined
□ Idempotency implemented
□ Consumer scaling tested
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Event triggers
- **→ Category 10** (Serverless) — Function triggers
- **→ Category 44** (Workflows) — Orchestration

---

## Category 24: Real-Time & WebSockets

### Scope
WebSocket servers, real-time updates, presence, collaboration.

### Technology Stack — Exhaustive

#### Real-Time Platforms
| Platform | Best For |
|----------|----------|
| **Pusher** | Managed, simple |
| **Ably** | Enterprise |
| **Socket.io** | Self-hosted |
| **Liveblocks** | Collaboration |
| **PartyKit** | Edge real-time |
| **Supabase Realtime** | PostgreSQL changes |

#### Collaboration Tools
| Tool | Features |
|------|----------|
| **Liveblocks** | Presence, storage |
| **Y.js** | CRDT, offline |
| **Automerge** | CRDT |

### Quality Gates

```
□ Connection handling robust
□ Reconnection logic implemented
□ Room/channel cleanup
□ Horizontal scaling tested
□ Authentication on connect
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — REST fallback
- **→ Category 50** (Auth) — Connection auth

---

## Category 25: Scheduled Jobs & Cron

### Scope
Scheduled tasks, cron jobs, recurring jobs, batch processing.

### Technology Stack — Exhaustive

#### Serverless Scheduling
| Service | Platform |
|---------|----------|
| **Vercel Cron** | Vercel |
| **Upstash QStash** | Serverless |
| **Inngest** | Cron + events |
| **Trigger.dev** | Background jobs |

#### Self-Hosted
| Tool | Language |
|------|----------|
| **node-cron** | Node.js |
| **APScheduler** | Python |
| **Celery Beat** | Python |

#### Monitoring
| Tool | Purpose |
|------|---------|
| **Cronitor** | Cron monitoring |
| **Healthchecks.io** | Dead man's switch |

### Quality Gates

```
□ Jobs idempotent
□ Overlapping runs prevented
□ Failure alerting
□ Dead man's switch monitoring
□ Run history stored
```

### Cross-Category Dependencies
- **→ Category 10** (Serverless) — Job execution
- **→ Category 23** (Queues) — Job queuing
- **→ Category 55** (Monitoring) — Job monitoring

---

## Category 26: Graph Processing & Knowledge

### Scope
Knowledge graphs, ontologies, graph algorithms, entity resolution.

### Technology Stack — Exhaustive

#### Graph Databases
| Database | Query Language |
|----------|---------------|
| **Neo4j** | Cypher |
| **Amazon Neptune** | Gremlin |
| **TypeDB** | TypeQL |

#### Graph Processing
| Framework | Best For |
|-----------|----------|
| **NetworkX** | Python analysis |
| **Neo4j GDS** | Neo4j algorithms |

### Quality Gates

```
□ Ontology/schema defined
□ Query performance optimized
□ Graph algorithms tested
□ Access controls configured
```

### Cross-Category Dependencies
- **→ Category 16** (Vector) — Semantic enrichment
- **→ Category 29** (RAG) — Knowledge retrieval

---

## Category 27: Data Transformation & ETL

### Scope
Data pipelines, ETL/ELT, data cleaning, schema evolution.

### Technology Stack — Exhaustive

#### ETL/ELT Frameworks
| Tool | Type |
|------|------|
| **dbt** | SQL transforms |
| **Airbyte** | Connectors |
| **Apache Spark** | Big data |
| **Polars** | Fast DataFrames |
| **DuckDB** | Embedded OLAP |

#### Data Validation
| Tool | Purpose |
|------|---------|
| **Great Expectations** | Data quality |
| **Pydantic** | Python validation |
| **Zod** | TypeScript validation |

### Quality Gates

```
□ Source validation implemented
□ Data quality checks automated
□ Idempotent transforms
□ Audit logging enabled
□ Data lineage tracked
```
### Data Versioning with DVC

#### Why Data Versioning Matters
ML projects require reproducibility. Code versioning (Git) is solved. **Data versioning is not.**

#### Recommended Stack
| Tool | Purpose | Integration |
|------|---------|-------------|
| **DVC** | Data + model versioning | Git-native |
| **LakeFS** | Git-like data lake | S3-compatible |
| **Delta Lake** | Versioned data tables | Spark ecosystem |

#### DVC Quick Start
```bash
# Initialize DVC in existing Git repo
dvc init

# Track large data file
dvc add data/training_set.parquet

# Push to remote storage
dvc remote add -d myremote s3://mybucket/dvc
dvc push
```

#### Data Lineage Pattern
```yaml
# dvc.yaml pipeline definition
stages:
  prepare:
    cmd: python src/prepare.py
    deps:
      - src/prepare.py
      - data/raw/
    outs:
      - data/prepared/
  
  train:
    cmd: python src/train.py
    deps:
      - src/train.py
      - data/prepared/
    outs:
      - models/model.pkl
``````

### Cross-Category Dependencies
- **→ Category 15-17** (Databases) — Source/target
- **→ Category 20** (Warehousing) — Destination
- **→ Category 44** (Workflows) — Orchestration
```
---

## Category 28: Feature Stores & ML Data

### Scope
Feature engineering, feature stores, training data, experiment tracking.

### Technology Stack — Exhaustive

#### Feature Stores
| Store | Type |
|-------|------|
| **Feast** | Open-source |
| **Tecton** | Managed |
| **Databricks Feature Store** | Databricks |

#### Experiment Tracking
| Tool | Features |
|------|----------|
| **MLflow** | End-to-end MLOps |
| **Weights & Biases** | Experiment tracking |
| **DVC** | Data versioning |

### Quality Gates

```
□ Feature definitions documented
□ Training/serving parity verified
□ Feature freshness monitored
□ Data drift detection
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Model training
- **→ Category 32** (Fine-tuning) — Training data

---

## Category 29: Agentic RAG Systems

### Scope
Retrieval-augmented generation, multi-hop reasoning, document processing.

### Technology Stack — Exhaustive

#### RAG Frameworks
| Framework | Best For |
|-----------|----------|
| **LlamaIndex** | Data framework |
| **LangChain** | Chains, agents |
| **Haystack** | Search pipelines |
| **DSPy** | Programmatic optimization |

#### Document Processing
| Tool | Purpose |
|------|---------|
| **Unstructured** | Document parsing |
| **LlamaParse** | LlamaIndex parsing |
| **Marker** | PDF to markdown |
| **Tesseract** | OCR |

#### Chunking Strategies
| Strategy | Use Case |
|----------|----------|
| **Fixed size** | Simple, predictable |
| **Semantic** | Meaning preservation |
| **Parent-child** | Context preservation |

#### Advanced Retrieval
| Technique | Purpose |
|-----------|---------|
| **Hybrid search** | BM25 + vector |
| **Re-ranking** | Relevance ordering |
| **Multi-hop** | Complex reasoning |
| **RAPTOR** | Tree-structured |

#### Chunking Strategy Selection Matrix

| Document Type | Recommended Strategy | Chunk Size | Overlap |
|---------------|---------------------|------------|---------|
| Technical docs | Semantic | 512-1024 | 50-100 |
| Legal/Financial | Page-level | 1 page | 0 |
| Code files | AST-based | Function | 0 |
| Conversations | Message-based | 1 message | Context |
| Research papers | Section-based | Section | Abstract |

#### Query Type Affects Optimal Size
| Query Type | Optimal Chunk Size | Rationale |
|------------|-------------------|-----------|
| Factoid ("What is X?") | 256-512 tokens | Precise answers |
| Analytical ("Why does X?") | 1024+ tokens | Needs context |
| Comparative ("X vs Y?") | 512-768 tokens | Multiple facts |
| Summarization | 2048+ tokens | Broad coverage |

#### Chunk Validation Pattern
```python
def validate_chunks(chunks):
    issues = []
    for i, chunk in enumerate(chunks):
        tokens = count_tokens(chunk)
        if tokens < 100:
            issues.append(f"Chunk {i}: Too small")
        if tokens > 2000:
            issues.append(f"Chunk {i}: Too large")
    return issues
```

---

### Quality Gates

```
□ Chunking strategy validated
□ Embedding model benchmarked
□ Retrieval recall measured
□ Re-ranker evaluated
□ Citation accuracy verified
□ Hallucination rate monitored
□ Latency requirements met
```

### Agentic Prompt Hook

```
You are building an Agentic RAG system. Before writing code:

1. DATA PREPARATION
   - Analyze document types
   - Design chunking strategy
   - Plan metadata schema

2. RETRIEVAL DESIGN
   - Select embedding model
   - Implement hybrid search
   - Add re-ranking

3. GENERATION DESIGN
   - Design prompt templates
   - Implement citation
   - Add guardrails

4. EVALUATION
   - Create test dataset
   - Measure retrieval recall
   - Test end-to-end accuracy

5. OUTPUT REQUIREMENTS
   - High retrieval recall
   - Accurate citations
   - Low hallucination rate
   - Acceptable latency
```

### Cross-Category Dependencies
- **→ Category 16** (Vector) — Retrieval
- **→ Category 30** (Agents) — Agent integration
- **→ Category 31** (MCPs) — Tool calling
- **→ Category 11** (GPU) — Inference

---

## Category 30: Autonomous Agents

### Scope
Task agents, workflow agents, multi-agent systems, tool use.

### Technology Stack — Exhaustive

#### Agent Frameworks
| Framework | Best For |
|-----------|----------|
| **LangGraph** | Stateful workflows |
| **CrewAI** | Multi-agent teams |
| **AutoGen** | Microsoft agents |
| **Agency Swarm** | Customizable |
| **Claude Computer Use** | Computer control |

#### Agent Components
| Component | Options |
|-----------|---------|
| **Planning** | ReAct, Plan-and-Execute |
| **Memory** | Conversation, Episodic |
| **Tools** | Code execution, web, APIs |
| **Reflection** | Self-critique |

#### Multi-Agent Patterns
| Pattern | Use Case |
|---------|----------|
| **Supervisor** | Centralized control |
| **Swarm** | Decentralized |
| **Debate** | Reasoning improvement |

### Quality Gates

```
□ Agent loops bounded
□ Error recovery implemented
□ Tool calls validated
□ Human-in-loop capability
□ Costs tracked per run
□ Security boundaries enforced
```

### Agentic Prompt Hook

```
You are building an autonomous agent. Before writing code:

1. DESIGN PHASE
   - Define agent objective
   - Plan tool requirements
   - Design state machine
   - Set autonomy level (→ NS Section 18: Autonomy Dial)

2. SAFETY PHASE
   - Implement loop bounds
   - Add human-in-loop gates
   - Set resource limits
   - Calibrate confidence thresholds (→ NS Section 17)

3. IMPLEMENTATION PHASE
   - Build tool integrations
   - Implement memory (→ NS Section 20: Memory Architecture)
   - Add reflection

4. EVALUATION PHASE
   - Create test scenarios
   - Measure success rate
   - Profile costs

5. OUTPUT REQUIREMENTS
   - Bounded execution
   - Human oversight
   - Reliable tool use
   - Observable runs
   - Handoff capability (→ NS Section 23: Handoff Protocols)

FOR ORCHESTRATION METHODOLOGY: See North Star Blueprint v5.0
  → Part IV (Sections 13-19): AI Orchestration
  → Part V (Sections 20-23): Agent Composition
```

### Cross-Category Dependencies
- **→ Category 29** (RAG) — Knowledge retrieval
- **→ Category 31** (MCPs) — Tool definitions
- **→ Category 44** (Workflows) — Orchestration

---

## Category 31: MCPs & Tool Registries

### Scope
Model Context Protocol, function calling, tool definitions, skill manifests.

### Technology Stack — Exhaustive

#### MCP & Tool Frameworks
| Framework | Provider |
|-----------|----------|
| **Model Context Protocol** | Anthropic |
| **Function Calling** | OpenAI |
| **Tool Use** | Various LLMs |

#### Tool Definition Standards
| Standard | Use |
|----------|-----|
| **OpenAPI** | REST API description |
| **JSON Schema** | Parameter validation |

### Quality Gates

```
□ Tool schemas validated
□ Parameter descriptions clear
□ Error responses defined
□ Audit logging enabled
□ Tool documentation complete
```

### Cross-Category Dependencies
- **→ Category 8** (APIs) — Tool backends
- **→ Category 29-30** (AI) — Agent integration
- **→ Category 50** (Auth) — Tool authentication

---

## Category 32: Model Fine-Tuning & Training

### Scope
LLM fine-tuning, LoRA adapters, RLHF, domain adaptation.

### Technology Stack — Exhaustive

#### Fine-Tuning Frameworks
| Framework | Best For |
|-----------|----------|
| **Axolotl** | Full-featured |
| **Unsloth** | Fast, memory-efficient |
| **TRL** | HuggingFace official |
| **LLaMA-Factory** | User-friendly |

#### Training Techniques
| Technique | Use Case |
|-----------|----------|
| **Full fine-tuning** | Maximum customization |
| **LoRA** | Efficient adaptation |
| **QLoRA** | Memory-constrained |
| **DPO** | Preference alignment |

#### Evaluation
| Tool | Purpose |
|------|---------|
| **lm-eval-harness** | Benchmark eval |
| **Promptfoo** | Prompt testing |
| **DeepEval** | LLM testing |
| **Ragas** | RAG evaluation |

### Quality Gates

```
□ Training data validated
□ Baseline performance measured
□ Evaluation suite comprehensive
□ Overfitting checked
□ Safety evaluation included
□ Model card created
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Training compute
- **→ Category 28** (Feature Store) — Training data
- **→ Category 33** (Inference) — Deployment

---

## Category 33: Model Serving & Inference

### Scope
LLM inference, model deployment, quantization, batching, caching.

### Technology Stack — Exhaustive

#### Inference Engines
| Engine | Best For |
|--------|----------|
| **vLLM** | High-throughput LLM |
| **TGI** | HuggingFace serving |
| **TensorRT-LLM** | NVIDIA optimized |
| **llama.cpp** | CPU/Metal |
| **Ollama** | Local LLMs |
| **SGLang** | Fast serving |

#### Serving Platforms
| Platform | Type |
|----------|------|
| **Replicate** | Managed models |
| **Modal** | Serverless GPU |
| **Together AI** | Inference API |
| **Fireworks AI** | Fast inference |
| **Groq** | Ultra-fast |

#### Optimization
| Technique | Purpose |
|-----------|---------|
| **Quantization** | Model compression |
| **Continuous batching** | Throughput |
| **Speculative decoding** | Latency |

### Quality Gates

```
□ Latency requirements met
□ Throughput benchmarked
□ Memory usage profiled
□ Auto-scaling tested
□ Health checks implemented
□ Cost per token calculated
```

### Cross-Category Dependencies
- **→ Category 11** (GPU) — Compute resources
- **→ Category 22** (Caching) — Response cache
- **→ Category 55** (Monitoring) — Inference metrics

---

## Category 34: LLM Routing & Orchestration

### Scope
Model selection, router logic, fallbacks, cost optimization, prompt management.

### Technology Stack — Exhaustive

#### LLM Gateways
| Gateway | Features |
|---------|----------|
| **LiteLLM** | 100+ providers |
| **Portkey** | Gateway + observability |
| **Helicone** | Logging + caching |
| **OpenRouter** | Multi-provider |

#### Prompt Management
| Tool | Features |
|------|----------|
| **Langfuse** | Open-source tracing |
| **LangSmith** | LangChain native |
| **PromptLayer** | Versioning |

### Quality Gates

```
□ Routing logic tested
□ Fallbacks configured
□ Cost tracking enabled
□ Prompt versions managed
□ Observability complete
```

### Cross-Category Dependencies
- **→ Category 29-33** (AI) — Model backends
- **→ Category 22** (Caching) — Response cache
- **→ Category 55** (Monitoring) — LLM metrics

---

## Category 35: AI Safety & Guardrails

### Scope
Content moderation, output validation, jailbreak prevention, PII detection.

### Technology Stack — Exhaustive

#### Guardrail Frameworks
| Framework | Features |
|-----------|----------|
| **Guardrails AI** | Output validation |
| **NeMo Guardrails** | NVIDIA framework |
| **LLM Guard** | Input/output safety |

#### Content Moderation
| Service | Provider |
|---------|----------|
| **OpenAI Moderation** | OpenAI |
| **Perspective API** | Google |
| **Azure Content Safety** | Microsoft |

#### PII Detection
| Tool | Type |
|------|------|
| **Presidio** | Microsoft OSS |
| **AWS Comprehend PII** | Managed |

#### Validation Tools
| Tool | Purpose |
|------|---------|
| **Pydantic** | Schema validation |
| **Instructor** | Structured outputs |
| **Outlines** | Constrained generation |

#### NeMo Guardrails Deep Dive

NVIDIA's NeMo Guardrails: **89% accuracy on prompt injection** (vs 67% Llama Guard).

**Rail Types:**
| Rail | Purpose | When Triggered |
|------|---------|----------------|
| **Input Rails** | Filter user input | Before LLM call |
| **Dialog Rails** | Control conversation | During interaction |
| **Output Rails** | Validate response | After LLM call |
| **Retrieval Rails** | Filter RAG context | Before injection |
| **Execution Rails** | Control tool calls | Before action |

**Colang 2.0 Example:**
```colang
define user express harmful intent
  "how do I hack"
  "write malware"

define flow handle harmful
  user express harmful intent
  bot refuse with explanation
```

#### Guardrails AI Pattern
```python
from guardrails import Guard
from guardrails.hub import ToxicLanguage, PIIDetection

guard = Guard().use_many(
    ToxicLanguage(threshold=0.5, on_fail="fix"),
    PIIDetection(on_fail="anonymize"),
)
```


---

### Quality Gates

```
□ Input validation implemented
□ Output validation configured
□ PII detection enabled
□ Jailbreak tests passed
□ Bias evaluation completed
□ Audit logging enabled
□ Incident response planned
```

### Cross-Category Dependencies
- **→ Category 29-34** (AI) — AI systems to protect
- **→ Category 52** (Security) — Security integration
- **→ Category 56** (Compliance) — Regulatory compliance

---


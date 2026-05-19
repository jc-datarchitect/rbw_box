<div align="center">
  <img src="https://github.com/user-attachments/assets/92b32d2f-d3ef-4165-95e0-db68ddefca98" width="40%" alt="RBW BOX Cover">

  <h1>RBW BOX: Algorithmic Traceability System for Generative Architecture Environments</h1>

  <p><i>"Investigating the social boundaries of generative architecture through empirical data and algorithmic traceability"</i></p>
  
  <br>

  [![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org/)
  [![SQL](https://img.shields.io/badge/Database-SQL-CC292B?style=flat&logo=microsoft-sql-server&logoColor=white)](#)
  [![PowerBI](https://img.shields.io/badge/Analytics-Power%20BI-F2C811?style=flat&logo=power-bi&logoColor=black)](https://powerbi.microsoft.com/)
  [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://opensource.org/licenses/MIT)
</div>

---

## Project Overview

**RBW BOX** is the synthesis and practical outcome of an extensive research project developed during the **Master's Degree in Big Data and Artificial Intelligence**. Positioned at the intersection of spatial design, data engineering, and computational sociology, the project investigates the profound social, epistemological, and creative implications stemming from the evolving role of the architect in the era of automated design.

To capture the complexity of this paradigm shift, the project adopts a **multifaceted approach** that bridges empirical data science with structural system architecture:

* **The Empirical Dimension:** It deploys a quantitative study backed by a global survey evaluating public and professional perceptions regarding the social impact of generative AI on the architectural creative process. This data pipeline focuses on the cleaning, normalization, and visualization of socio-technical variables to map current human-AI friction.
* **The Structural Dimension:** To answer the challenges of algorithmic authorship and theoretical tensions identified in the data, the project prototypes an **Algorithmic Traceability System**. This framework is engineered for generative architecture environments, ensuring data transparency, tracking AI-human design provenance, and establishing a structured, auditable pipeline for generative outputs.

---

## Repository Structure

This repository is structured into specialized directories that separate the empirical data, computational architecture, business intelligence dashboards, and academic documentation:

```text
├── analytics/
│   └── rbw_box_dashboard.pbix         # Power BI Dashboard containing the analytical model
├── data/
│   ├── rbw_box_codebook.xlsx          # Data dictionary mapping clean variable IDs to original survey questions
│   └── rbw_box_survey_responses.xlsx  # Cleaned and standardized survey data (raw inputs)
├── database/
│   └── rbw_box_schema.sql             # Relational schema for the Algorithmic Traceability System
├── documents/
│   ├── rbw_box_investigation.pdf      # Main Master's Thesis document
│   └── rbw_box_phantom_space.pdf      # Complementary research on theoretical/spatial boundaries
└── README.md                          # System documentation and project overview
```

---

## Directory Breakdown

* **`analytics/`**: Contains the Business Intelligence implementation. Here lies the Power BI file (`.pbix`) that processes the survey data, designs the dimensional model (star schema), and displays the interactive dashboards measuring public and professional perception.
* **`data/`**: Dedicated exclusively to storing the quantitative data source. It holds the finalized, cleaned, and standardized dataset resulting from the generative architecture socio-technical survey.
* **`database/`**: Houses the structural backend proposal. It contains the SQL scripts and relational schema designed to support the pipeline of the proposed Algorithmic Traceability System.
* **`documents/`**: Holds the core academic and theoretical foundations of the research, featuring my main investigation documentation developed during the Master's program alongside my complementary essay regarding speculative and epistemological boundaries, titled *The Phantom Space Syndrome*.

---

## Tech Stack

* **Analytics & BI:** Power BI (Modelado relacional, diseño de esquemas y creación de dashboard interactivo).
* **Database Design:** SQL (Diseño del esquema lógico y relacional para el sistema de trazabilidad algorítmica).
* **Data Engineering & Prep:** Python (Pandas & NumPy for data manipulation and cleaning) & Microsoft Excel (String mapping and raw variable standardization).

---

## Future Work & Roadmap

- [ ] **Automated Data Pipeline:** Implement a Python ETL pipeline using Pandas to automate the cleaning process directly from the survey API.
- [ ] **Database Deployment:** Migrate the `.sql` schema into a live PostgreSQL/MySQL instance to test real-time data ingestion.
- [ ] **Traceability API:** Develop a lightweight FastAPI backend to log design provenance metrics into the database.

---

## Support & Feedback

If you have any questions, suggestions, or want to discuss generative architecture and data systems, feel free to reach out or connect on jcristobalfdez@gmail.com. 

If you find this project useful, consider leaving a ⭐ to support the research!

# Community Communications Performance

Analyze engagement across Email, DM, and Announcements, by segment and program. Includes SQL, a notebook, and a weekly digest generator.

## Files
- `comms_data.csv` — synthetic comms dataset
- `comms_sql.sql` — ready-to-run SQL analytics
- `Comms_Performance_Analysis.ipynb` — annotated notebook with charts
- `generate_weekly_digest.py` — builds `weekly_digest_SAMPLE.md` from last 7 days
- `weekly_digest_SAMPLE.md` — example output

## Quick Start
1. Open the notebook and run cells.
2. Or run: `python generate_weekly_digest.py` to create a weekly digest.
3. Use `comms_sql.sql` in SQLite/Postgres (adjust date functions as needed).

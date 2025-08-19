
import pandas as pd
from datetime import timedelta

df = pd.read_csv('comms_data.csv', parse_dates=['send_time'])
end = df['send_time'].max()
start = end - timedelta(days=7)
recent = df[(df['send_time'] >= start) & (df['send_time'] <= end)]

kpi = recent.agg({'open_rate':'mean','ctr':'mean','reply_rate':'mean'}).round(3)
top_subjects = (recent.groupby('subject')
                .agg(score=('open_rate','mean'), sends=('subject','count'))
                .sort_values('score', ascending=False).head(3))

content = []
content.append(f"# Weekly Community Digest\n")
content.append(f"**Period:** {start.date()} to {end.date()}\n")
content.append("## KPIs (avg)")
content.append(f"- Open Rate: {kpi['open_rate']}")
content.append(f"- CTR: {kpi['ctr']}")
content.append(f"- Reply Rate: {kpi['reply_rate']}\n")
content.append("## Top Performing Subjects")
for idx, row in top_subjects.iterrows():
    content.append(f"- {idx} (score={round(row['score'],3)}, sends={int(row['sends'])})")
content.append("\n---\n")
content.append("_Generated from comms_data.csv_")

with open('weekly_digest_SAMPLE.md', 'w', encoding='utf-8') as out:
    out.write("\n".join(content))

print("Digest generated: weekly_digest_SAMPLE.md")

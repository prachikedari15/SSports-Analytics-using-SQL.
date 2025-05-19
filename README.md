
  <h1>🏏 Sports Analytics using SQL</h1>
  <p>This project is a comprehensive <strong>SQL-based analytical exploration</strong> of IPL (Indian Premier League) cricket data. It demonstrates the end-to-end process of importing, structuring, querying, and deriving insights from match and ball-by-ball data using SQL.</p>

  <h2>📌 Objective</h2>
  <p>To simulate the role of a <strong>Sports Data Analyst</strong> by analyzing IPL datasets using SQL and generating valuable insights related to match outcomes, player performance, team statistics, and ball-by-ball events.</p>

  <h2>📂 Project Structure</h2>
  <ul>
    <li><strong>Files Included:</strong>
      <ul>
        <li><code>Final Project - Sports Analytics using SQL.sql</code>: Contains all SQL queries and commands executed for the analysis.</li>
      </ul>
    </li>
    <li><strong>Data Used:</strong>
      <ul>
        <li><code>IPL_matches.csv</code>: Match-level information like teams, venue, toss, and results.</li>
        <li><code>IPL_Ball.csv</code>: Ball-by-ball delivery data including runs, wickets, batsmen, bowlers, etc.</li>
      </ul>
    </li>
  </ul>

  <h2>🛠️ Key SQL Concepts Used</h2>
  <ul>
    <li>Table creation and data import</li>
    <li>Filtering, ordering, grouping and aggregation</li>
    <li>Joins and subqueries</li>
    <li>CASE statements</li>
    <li>Use of window functions: <code>ROW_NUMBER()</code></li>
    <li>Data cleaning using <code>CASE</code> correction logic</li>
    <li>Column transformations (e.g., <code>CONCAT</code> for <code>ball_id</code>)</li>
  </ul>

  <h2>🧪 Major Tasks Performed</h2>
  <ul>
    <li><strong>Table Creation:</strong> Created <code>Matches</code> and <code>Deliveries</code> tables with appropriate schema.</li>
    <li><strong>Data Import:</strong> Imported CSV data into respective tables.</li>
    <li><strong>Exploratory Analysis:</strong>
      <ul>
        <li>Top matches by date</li>
        <li>High-margin wins</li>
        <li>Match results based on city, team, or toss decisions</li>
      </ul>
    </li>
    <li><strong>Derived Columns:</strong>
      <ul>
        <li>Added a <code>ball_result</code> column to classify each delivery.</li>
        <li>Created <code>ball_id</code> as a composite key using match ID, over, ball.</li>
      </ul>
    </li>
    <li><strong>Aggregations:</strong>
      <ul>
        <li>Boundaries and dot balls per team</li>
        <li>Extra runs conceded by bowlers</li>
        <li>Yearly runs at specific venues</li>
      </ul>
    </li>
    <li><strong>Data Cleaning:</strong> Corrected team name inconsistencies using <code>CASE</code>.</li>
    <li><strong>Duplicate Detection:</strong> Used <code>ROW_NUMBER()</code> with <code>PARTITION BY</code> to find duplicate <code>ball_id</code>s.</li>
  </ul>

  <h2>📊 Sample Insights</h2>
  <ul>
    <li>Top 5 bowlers who conceded the most extras</li>
    <li>Cities that hosted the most matches</li>
    <li>Total runs scored at "Eden Gardens" each year</li>
    <li>Number of dot balls delivered by each bowling team</li>
    <li>Team-wise boundary analysis</li>
  </ul>

  <h2>📈 Tools Used</h2>
  <ul>
    <li>SQL (MySQL/PostgreSQL compatible syntax)</li>
    <li>CSV data files</li>
    <li>Any SQL editor (e.g., MySQL Workbench, pgAdmin, DBeaver)</li>
  </ul>

  <h2>📚 Learning Outcomes</h2>
  <ul>
    <li>Hands-on experience with real-world sports data</li>
    <li>Improved SQL query writing skills</li>
    <li>Enhanced understanding of data transformation and aggregation</li>
    <li>Applied data cleaning and anomaly detection using SQL</li>
  </ul>

  <h2>📣 Get in Touch</h2>
  <p>Feel free to connect if you’d like to collaborate, ask questions, or learn more about data analytics!</p>

</body>
</html>

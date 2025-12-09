import React, { useEffect, useState } from "react";

function App() {
  const [config, setConfig] = useState(null);
  const [error, setError] = useState(null);

  const backendUrl = "http://backend-dev-mono-app-backend.backend-dev.svc.cluster.local:80/api/message"
  useEffect(() => { 
    fetch(backendUrl)
      .then((res) => {
        if (!res.ok) throw new Error("Backend error");
        return res.json();
      })
      .then(setConfig)
      .catch((err) => setError(err.message));
  }, [backendUrl]);

  return (
    <div style={{ fontFamily: "sans-serif", padding: "2rem" }}>
      <h1>Demo Frontend</h1>
      <p>Backend URL: {backendUrl}</p>

      {error && <p style={{ color: "red" }}>Error: {error}</p>}

      {!config && !error && <p>Loading config from backend...</p>}

      {config && (
        <div style={{ marginTop: "1rem" }}>
          <h2>Backend Config</h2>
          <pre>{JSON.stringify(config, null, 2)}</pre>
        </div>
      )}
    </div>
  );
}

export default App;

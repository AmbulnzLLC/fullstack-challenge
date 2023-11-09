import app from "./app";
import { pizzasRouter } from "./routes/pizzasRouter";

app.use("/api", pizzasRouter);

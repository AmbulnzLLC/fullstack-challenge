import { ThemeProvider as MuiThemeProvider } from "@mui/material";
import Router from "./Routes/Router";
import GlobalStyle from "./Global/GlobalStyles";
import theme from "./Global/theme";
function App() {
  return (
    <>
      <GlobalStyle />
      <MuiThemeProvider theme={theme}>
        <Router />
      </MuiThemeProvider>
    </>
  );
}

export default App;

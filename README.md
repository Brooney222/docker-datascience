# Data Science Docker Environment

```bash
docker compose up
```


##### Perferred Theme Settings

```json
{
	// Theme
	// @jupyterlab/apputils-extension:themes
	// Theme manager settings.
	// *************************************

	// Theme CSS Overrides
	// Override theme CSS variables by setting key-value pairs here
	"overrides": {
	"ui-font-size1": "12px",
	"content-font-size1": "12px",
	"code-font-size": "12px"
	},

	// Selected Theme
	// Application-level visual styling theme
	"theme": "Darcula",

	// Scrollbar Theming
	// Enable/disable styling of the application scrollbars
	"theme-scrollbars": true
}
```

##### pytorch install commandline

```bash
'conda install pytorch torchvision torchaudio cpuonly -c pytorch' && \
```
##### To-Do

Create dockerized postgres database for frequently used datasets. Save utility functions in utils directory script with sqlalchemy connector in utils directory

home
<br>
| -- src
<br>
| -- utils
<br>
| -- cheat-sheets
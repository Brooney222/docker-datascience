# How do I switch NB_USER from jovian to my own custom name?
# Tutorial: https://www.youtube.com/watch?v=UXxUcZDSNwA
FROM jupyter/datascience-notebook

USER root
RUN apt update && \
	# install packages
	# apt install -y <packages>
	jupyter labextension install @telamonian/theme-darcula && \
	apt clean && rm -rf var/lib/apt/lists/*

USER $NB_UID 
RUN conda install --quiet --yes \
	# python packages
	# pytorch -c pytorch && \
	openpyxl && \
	# R packages
	conda clean --all -f -y && \
	fix-permissions "${CONDA_DIR}" && \
	fix-permissions "/home/${NB_USER}"


# NEXT: Specify all my settings

# most important: arrow key scolling issue

# 1. Autoclose brackets ("matchBrackets": true)
# 2. font size
# 3. Turn off "folding header cells"
# 4. autosave interval: 5 seconds
# 5. jupyter widgets save state: true
# 6. what does "rulers" do?

# {
# 	// Theme
# 	// @jupyterlab/apputils-extension:themes
# 	// Theme manager settings.
# 	// *************************************

# 	// Theme CSS Overrides
# 	// Override theme CSS variables by setting key-value pairs here
# 	"overrides": {
# 	"ui-font-size1": "12px",
# 	"content-font-size1": "12px",
# 	"code-font-size": "12px"
# 	},

# 	// Selected Theme
# 	// Application-level visual styling theme
# 	"theme": "Darcula",

# 	// Scrollbar Theming
# 	// Enable/disable styling of the application scrollbars
# 	"theme-scrollbars": true
# }



# 'conda install pytorch torchvision torchaudio cpuonly -c pytorch' && \

# IDEA: Have a your favorite datasets saved in a postgres database and contained in a docker container. 
# Save on github.
# Save script with sqlalchemy connector in utils directory
#
# . home
# | -- src
# | -- utils
# Result: Easily connect to currently relevant dataset
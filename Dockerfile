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

# pytorch install commandline
# 'conda install pytorch torchvision torchaudio cpuonly -c pytorch' && \


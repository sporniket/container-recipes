# container-recipes
A collection of container recipes to solves my various problems

## LICENCE

I will put proper licence file and notices later, but basically, all is GPL v3 or later.

## HOW TO USE

### Requirement of base containers

See the recipe of interest to see specific requirements.

For inter-recipe requirements (e.g. _recipe B requires recipe A in version V_), one MUST perform a **partial** checkout of the required recipe folder to the specified version `A--V`. In other words, this repository will have a tag `<recipe_name>--<version>`, with `<recipe_name>` being the folder name of the recipe ; recipes in subfolder will use a notation using dot, e.g. the recipe of _C_ stored in path `A/C` will have tags starting with `A.C--`.

### Build a container

See the `README.md` of the recipe of interest.

Most of the time, each recipe will provide a generic `build.bash` ; sometime, other specialized build scripts will be available, leveraging the generic script.

Read those scripts to see what they do : they are helpers and serves as _informative_ reference about the _recommended_ way to build the container.

### Start a container

**When** the recipe of interest contains an `abstract` in its name, e.g. `debian-based--abstract--cpp-dev`, it means that the goal of the container is to serve as base to another recipe. **It is not meant to be started**, and thus, no guidance is provided.

**Otherwise**, the recipe of interest contains a generic `run.bash` ; sometimes other specialized run scripts will be available, leveraging the generic script.

Read those scripts to see what they do : they are helpers and serves as _informative_ reference about the _recommended_ way to start the container.

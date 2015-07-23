docker-pyplates
===============

This is a [Docker][1] container based on the ubuntu base container image.  The
container is used for building CloudFormation scripts using the [cfn-pyplates][2]
Python library.

More documetation on using pyplates can be found at https://cfn-pyplates.readthedocs.org/en/latest/

Usage
-----

This container is basically just a self-contained environment from which the
[cfn-pyplates][2] scripts can run.  However, this repository also contains the
`mkcf.sh` script that helps make running the container in a reasonable way
easier.  The script expects as options a directory containing a template and any
files used by the template, as well as the name of the file to which to write
the CloudFormation script.  The script takes care of mounting the specified
directory as well as calling the cfn_py_generate command.  The script assumes
that the template file is located in that directory and is named *template.py*.

```
./mkcf.sh /path/to/templates template.json
```

Obviously, replace */path/to/templates* and *template.json* pieces with the
actual path to the template directory and the name of the file to write
respectively.

[1]: https://www.docker.com/ "Docker"
[2]: https://github.com/seandst/cfn-pyplates "cfn-pyplates"

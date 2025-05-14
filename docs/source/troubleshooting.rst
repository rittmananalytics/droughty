Troubleshooting & Frequently Asked Questions
===========================================

This page covers common errors, workarounds, and known issues when using Droughty. For additional help, please open an issue on the project repository.

Missing `droughty_qa_assumptions` YAML File
-------------------------------------------
**Error Message:**
    `/filepath/ droughty_qa_assumptions is not defined`

**Solution:**
Create a blank file named `droughty_qa_assumptions.yaml` in your project directory. This will resolve the error. In the future, if you want to use Droughty QA assumptions, this is where you would define them.

.. note::
   Future documentation on the structure and usage of `droughty_qa_assumptions.yaml` is coming soon.

AttributeError: 'ProjectVariables' has no attribute 'langsmith_secret'
---------------------------------------------------------------------
**Error Message:**
    `AttributeError: type object 'ProjectVariables' has no attribute 'langsmith_secret'`

**Solution:**
Add the following (optional) attributes to your YAML configuration file:

.. code-block:: yaml

    langsmith_secret: <your-secret>
    langsmith_project: <your-project>

These are only required if you are using LangSmith features. If not, you can add them as blank or omit them.

Google Authentication Issues
----------------------------
If Google authentication does not work:

1. Try authenticating manually (e.g., using `gcloud auth application-default login`).
2. If issues persist, restart your terminal and try again.
3. If it still asks for a key file after restarting, this often resolves issues where Google Auth is not detecting your credentials and is unnecessarily prompting for a key file.
4. Refer to the :doc:`authentication` guide for detailed setup instructions.

{% macro lowercase_filename_check(model) %}

    {% set filename=model.path.split('/')[-1] %}
        
    {% if filename is not lower %}
        
        {{ exceptions.raise_compiler_error("Your filenames must be lowercase. Problem file: " ~ filename) }}

    {% endif %}

{% endmacro %}
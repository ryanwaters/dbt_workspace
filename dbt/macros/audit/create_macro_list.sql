{% macro list_macros(prefix) %}
    {% set macro_list = [] %}

    -- Loop through nodes in graph object
    {% for node in graph['nodes'] %}
        
        -- Check if node depends on any macros
        {% set resource = graph['nodes'][node] %}
        {% if resource.depends_on.macros | length > 0 %}
            
            -- Loop through existing macros
            {% for macro_path in resource.depends_on.macros %}
                
                -- Extract macro name from macro path
                {% set macro_name = macro_path.split('.')[-1] %}
                
                -- Check if macro prefix matches and this is a root project macro
                {% if prefix == macro_name.split('_')[0] and project_name == resource.package_name %}
                    
                    -- Add macro to macro list
                    {{ macro_list.append(macro_name)}}
                
                {% endif %}
            
            {% endfor %}
        
        {% endif %}
    
    {% endfor %}

{{ log("List of macros to execute: " ~ macro_list, info=True) }}
{{ return(macro_list) }}

{% endmacro %}

<%inherit file="project/project_base.mako"/>
<%def name="title()">Register Component</%def>

<legend class="text-center">Register</legend>

% if schema:

    <%include file="metadata/register_${str(metadata_version)}.mako" />

% else:

    <form role="form">

        <div class="help-block">${language.REGISTRATION_INFO}</div>

        <select class="form-control" id="select-registration-template">
            <option>Please select a registration form to initiate registration</option>
            % for option in options:
                <option value="${option['template_name']}">${option['template_name_clean']}</option>
            % endfor
        </select>
    </form>


    <script type="text/javascript">
        $('#select-registration-template').on('change', function() {
            var $this = $(this),
                val = $this.val();
            if (val != 'Please select')
                window.location.href += val;
        });
    </script>

% endif

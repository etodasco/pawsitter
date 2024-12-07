module ApplicationHelper
    def status_class(status)
        case status
        when 'accepted'
            'text-success' # Green
        when 'declined'
            'text-danger'  # Red
        when 'pending'
            'text-warning' # Yellow
        else
            'text-secondary' # Default color (gray)
        end
        end
end

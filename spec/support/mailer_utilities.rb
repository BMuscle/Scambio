def get_message_part (mail, content_type)
    mail.body.parts.find { |p| p.content_type.match content_type }.body.raw_source
end
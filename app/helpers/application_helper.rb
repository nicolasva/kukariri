module ApplicationHelper
  def be_backbone?
    request.path.scan(/^.{1,}(#).{1,}$/) == Array.new && request.path != "/" ? true : false
  end
end

def titleize(string)
  string.split(" ").map(&:capitalize).join(" ")
end

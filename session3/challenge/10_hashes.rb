# Lets represent a file system with hashes
# You will be passed a hash table, whose keys represent folders.
# Their values will either be arrays of filenames in that directory
# or they will be hashes with the same rules (a treelike structure)
#
# Your job is to take the hashes, and return an array containing
# all of the complete file paths where each directory is separated by a '/'
#
# HINT:
#   [1,2,3].is_a? Array # => true
#   [1,2,3].is_a? Hash  # => false
#   {1=>1}.is_a?  Array # => false
#   {1=>1}.is_a?  Hash  # => true
#
# HINT2:
#   Don't feel constrained, you may create any methods, classes, etc, that
#   you need to you may address the problem in any way you need to (I
#   haven't tried it yet, but will probably use a recursive approach)
#
# EXAMPLES:
#
# pathify 'usr' => {'bin' => ['ruby'] }                                                        # => ['/usr/bin/ruby']
# pathify 'usr' => {'bin' => ['ruby', 'perl'] }                                                # => ['/usr/bin/ruby', '/usr/bin/perl']
# pathify 'usr' => {'bin' => ['ruby'], 'include' => ['zlib.h'] }                               # => ['/usr/bin/ruby', '/usr/include/zlib.h']
# pathify 'usr' => {'bin' => ['ruby']}, 'opt' => {'local' => {'bin' => ['sqlite3', 'rsync']} } # => ['/usr/bin/ruby', 'opt/local/bin/sqlite3', 'opt/local/bin/rsync']
# pathify                                                                                      # => []
#
#
# create it from scratch :)


def pathify(paths=Hash.new)
  # base step
  return paths.map { |path| '/' + path } if paths.is_a? Array

  # recursive step
  to_return = []
  paths.each do |parent_path, child_dirs|
    parent_path = '/' + parent_path
    child_paths = pathify child_dirs
    child_paths.each do |child_path|
      to_return << (parent_path + child_path)
    end
  end
    to_return
end

# base step identifies the difference between hashes and arrays. This helps to determine
# parentage for the path. i.e. keys(hashes) will be parents ans the corresponding
# values to be children.
# return array declared ln37
# iterates over each path given using the block in ln 39 to ln 42.
# parent_path acting as the key and the child_path becomes the value.
# each of these will be separated with the '\'.
# This is then all appended to the array delcared at the start of the block.

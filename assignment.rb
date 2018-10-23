

#Noman GHOUS 15085553

# class MyString starting from here
class MyString
# this will let user read and write str
  attr_accessor :str
  # this will let user only read hash and not allow writing it
  attr_reader :letters

  # constructor with default value and we can put custom value with given parameter
  def initialize(str = 'Hello World!')
    @str = str
    # creating hash
     @letters = Hash.new(0)
  end
# anything from here till the 'public' keyword will be private
  private
  # this is private method
  def frequency
    # normal string which has assigned all the alphabets
    name = 'abcdefghijklmnopqrstuvwxyz'
    # this line will first split 'name' string and then assign it to hash
    @letters = name.split('').reduce(@letters){|alphabet,count| alphabet[count] +=0; alphabet}
    # this will convert all the alphabets of 'str' to lower case
    @str = @str.downcase
    # this will remove special characters from the string and only allow lower case alphabets
    @str = @str.gsub(/[^a-z]/, '')
    # this will split the 'str' and assign the letters to hash and add 1 each time the letter appeared
    @letters = @str.split('').reduce(@letters){|alphabet,count| alphabet[count] +=1; alphabet}

  end
  # this is the end of private and anything after this is public
  public
  def histogram
    # calling frequency method from inside the class because it is not accessible from outside
    frequency
    #finally printing * for each alphabet in hash by how many times it appeared
    @letters.each{|alphabet,count| puts "#{alphabet}: #{'*' * count} "}
  end
end
text = MyString.new
text.histogram
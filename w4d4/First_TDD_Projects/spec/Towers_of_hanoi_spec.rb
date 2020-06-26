require 'Towers_of_hanoi'

#set of arrays(3 total)
#can only move a number if the first number of the other array is greater
#than the moving number or if the other array is empty.
#create a vairable that equals the original array
#we'll know that we have won when the third array is equal to the original array
#variable
describe Towers do 
    subject(:tower) {Towers.new(4)}
    #let(:input) {double('Input', :gets => "arr1")}
    
    describe '#initialize' do 
        it 'sets a disc number' do 
            expect(tower.disc_num).to eq(4)
        end
    end

    describe '#move' do
        it 'moves from start to end pos' do 
            tower.move("1","2")
            expect(tower.arr2).to eq([1])
            #call tower.move(1, 2)
            #expect the output be arr1 = [234] ; arr2 = [1] ; arr = []
        end 
    end
    
    describe "#won?" do
        it 'returns true if winning pile equal arr2 or arr3' do
            tower.arr3 = winning_arr
            expect(tower.won?).to eq(true)
        end 

        it 'returns false if winning pile does not equal arr2 or arr3' do
            expect(tower.won?).to eq(false)
        end 
    end 
end

# disc_num = whatever number user puts in 
# arr1 = (1..disc_num).to_a
# arr2 = []
# arr3 = []

# winning_arr = (1..disc_num).to_a
# double for input = "arr1"
# if the input = ["arr1" "arr2" "arr3"]
#     arr1.shift 

#move

#valid_move -- #can only move a number if the first number of the other array is greater
#than the moving number or if the other array is empty.

#won? #we'll know that we have won when the third array is equal to the original array
#variable

#play - calls the move and won until won == true
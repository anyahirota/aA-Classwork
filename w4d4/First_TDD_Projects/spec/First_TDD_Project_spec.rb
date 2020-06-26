require 'First_TDD_Project'

describe '#remove_dups' do 
    context "when array has duplicates" do
        it 'removes duplicates in an array' do
            expect(remove_dups([1, 2, 1, 3, 3])).to eq([1,2,3])
        end
    end

    context "when array does not have duplicates" do
        it 'returns same array' do
            expect(remove_dups([1, 2, 1, 3, 3])).to eq([1,2,3])
        end
    end

    context 'when array is empty' do
        it 'returns []' do
            expect(remove_dups([])).to eq([])
        end
    end
end

describe '#two_sum' do
    it "raise error if input is invalid" do
        expect {two_sum("hello")}.to raise_error('Argument Error')
    end 

    it "give positions of pairs that sum to zero in order of index" do
        expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
    end
end 

describe '#my_transpose' do
    subject(:matrix) {[ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]}
    it 'makes rows into columns' do
    expect(my_transpose(matrix)).to eq([[0, 3, 6],  [1, 4, 7], [2, 5, 8]])
    end
end

describe '#stock_picker' do
    subject(:stocks) {[10, 3, 4, 8, 12]}
    it 'return the most profitable pair of stocks' do
        expect(stock_picker(stocks)).to eq([1, 4])
    end 
end 







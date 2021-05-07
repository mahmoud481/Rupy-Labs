class ComplexNum 

    @@plus = 0
    @@multiply=0
    @@bulk_add=0
    @@bulk_multiply=0

    attr_accessor :real, :imaginary
    def initialize (real,imaginary)
        @real = real
        @imaginary = imaginary
    end

    def +(cn)
        @@plus += 1
        addedComplexNum = ComplexNum.new(self.real+cn.real,self.imaginary+cn.imaginary)
        return addedComplexNum
    end

    def *(cn)
        @@multiply += 1
        multipliedComplexNum = ComplexNum.new((self.real * cn.real-self.imaginary*cn.imaginary) , (self.real*cn.imaginary + cn.real*self.imaginary)) 
        return multipliedComplexNum
    end

    def self.bulk_add(cns)
        @@bulk_add+=1
        bulkAddedCn = ComplexNum.new(0,0)
        cns.each do |cn| 
            bulkAddedCn = bulkAddedCn + cn
        end
        return bulkAddedCn
    end

    def self.bulk_multiply(cns)
        @@bulk_multiply+=1
        bulkMultipliedCn = cns.first
        cns.drop(1).each do |cn| 
            bulkMultipliedCn =  bulkMultipliedCn * cn 
        end
        return bulkMultipliedCn 
    end  
    
    def self.get_stats
        puts ("Add :#{@@plus} - Multiply: #{@@multiply} - bulk_add: #{@@bulk_add} - bulk_multiply: #{@@bulk_multiply}")
    end

end


### case
def printNum(cn)
    puts(cn.real.to_s + " + " + cn.imaginary.to_s + "i")
end 

compexNum1 = ComplexNum.new(3,2)
compexNum2 = ComplexNum.new(1,7)

printNum(compexNum1+compexNum2)
printNum(compexNum1*compexNum2)
printNum(ComplexNum.bulk_add([compexNum1,compexNum2]))
printNum(ComplexNum.bulk_multiply([compexNum1, compexNum2]))
ComplexNum.get_stats

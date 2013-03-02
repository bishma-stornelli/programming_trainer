#Guia 1 Ruby
#Este material fue construido
# tomando como referencia el API de ruby
# no existe propiedad intelectual sobre este
# archivo

#Abrir una consola de ruby.
irb
#Ejecutar un programa de archivo.
ruby "file.rb"
#Para llamar o requerir archivos
require "numbers" 
load "numbers"

#Entrada y Salida
puts "Hello World" 
user_input = gets #Para permitir entrada
puts user_input
print "Sin salto de Linea"

#Comentarios
#Esto es un comentario
=begin
 Esto es comentar multilinea
=end
#Operacion con numeros 
3 + 5         	# Suma
3 - 4         	# Resta
3 * 1         	# Multiplicación
3 / 2         	# División (Entera)
3.5 / 1.5 		# División (Flotante)
2 ** 500    	# Exponenciación
5 % 4	        # Módulo

#Strings
"Esto es String"
'Esto es String'
%Q(Stringlargos)
%q{StringLargos}
#Para ejecutar comandos en el SO
`dir` #Devuelve la salida del SO

#Inerpolacion
"This is My {name}"

#Variables
variable = 1
variable2 = "De tipo String"
variable_tres = "#{variable}"
_cuarta_variable = variable_tres.to_i
variable = "Era número, ahora no"
a, b = b, a # Asignación paralela

# Variable Global: 
$VAR_GLOBAL # Empiezan con $
# Variable Local: 
variable_local # Empiezan con _ o letra
# Variable De instancia: 
@variable_de_instancia # Empiezan con @
#Variable De clase: 
@@variable_de_clase # Empiezan con @@

# Convenciones
CamelCaseParaClases #Nombres de Clase
snake_case_para_metodos #Nombres de metodos
RUBY #Nombres de Variables Globales o Constantes

#Booleanos
true && false # => false
false || true # => true
nil # Representa NULL y evalua false

#Simbolos (Inmutables)
# Con una unica dirección en memoria
:a_symbol
:"Another one"

#Arreglos
a = [1, 2, 3, 4]    # Se definen entre []
    a[0]        # => 1 
    a[1] = "s"     # => "s"
    a[4]         # => nil
    a[-1]        # => 4
    a[-2]        # => 3
    a[6] = false    # => false
#[1, "s", 3, 4, nil, nil, false]

#Rangos
1..5 === 3            # true
1..5 === 7            # false
'a'..'f' === 'b'        # true

#Hashes
h = { :a => "b", :c => :d, 4 => 2 }
	#=> { :a => "b", :c => d, 4 => 2 }
    h[:a] # => "b"
    h["b"] # => nil
    h[nil] = [2,3] # => [2, 3]
    h #=> {:a => "b",:c => :d,4 => 2,nil => [2, 3]}
only_symbols = { a: 2, b: "s", c: false }
#=> { :a => 2, :b => "s", :c => false }

#Métodos
def name_of_the_method(attr1, attr2)
        ...
        return false
end
#Llamada
object.method_name(attr1, attr2)
#Modo poetico (Sin return ni parentesis)
def pi_exp exp
        3.1416 ** exp
end
# Las llaves de un hash son opcionales
def example attr_ignored, this_is_a_hash
	puts this_is_a_hash
end
example nil, :a => 2 #Hash sin parentesis
# {:a => 2}
# => nil

#Parametros opcionales 
def mirror( attr_ignored, image = 3 )
    image
end
mirror 3         # => 3
mirror(3)           # => 3
mirror 3, 5         # => 5
mirror(3, 7)        # => 7
def this_is_wrong(attr1, attr2 = nil, attr3)
end

#El operador splat
*[1,2,3,4]                    # => 1,2,3,4 (error)
Hash[ *[1,2,3,4] ]    # => {1 => 2, 3 => 4}
def example *args
    args.inspect
end
example            # => []
example 1, 2, 3    # => [1,2,3]
example 1, 2, c: 3 # => [1,2,{:c => 3}]

#Parametros infinitos y hash
def my_print *args
    options 
end
my_print                # args = [], options = {}
my_print 1            # args = [1], options = {}
my_print a: 2        # args = [], options = {:a => 2}
my_print 1 , nil,  a: 2, c: 3
# args = [1,nil], options = {:a => 2, :c => 3}

# Convenciones de nombres  en metodo
def assign_value=(value) end
def return_boolean? end
def do_something_dangerous! end

#Bloques
3.times { print "ja " }
    ja ja ja => 3
#Cuando recibe parametros y bloques
object.example(params){ bloque }

#Bloques con varias lineas
object.method do
        a = 2
        puts a
end

#Cuando el bloque recibe parametros |args1,args2..|
[1,2,3].each_with_index do |elem, index|
        # do something with elem and index
    end
#Iterar un string
%w(perro gato raton).each do |animal|
	puts animal
end

#Yield Time
def five_times
        5.times { yield }
end
def each_with_index_until_three
        [1,2,3].each_with_index do |e,i|
        yield e , i 
    	end
end

#Si queremos que un método guarde un bloque
#en una variable para, por ejemplo, usarlo después:
# block == nil if !block
def method *args, &block
	@the_block = block
end
def another_method
    @the_block.call
end
#Bloques en variables. Procedures, Proc
# No validan argumentos
# No pueden tener un return (ni explicito, ni implicito)
	my_block = Proc.new{ puts "A block"}
#Procs como objetos
def callbacks(procs)
  procs[:starting].call
  puts "Still going"
  procs[:finishing].call
end
callbacks(:starting => Proc.new { puts "Starting" },
        :finishing => Proc.new { puts "Finishing" })

#Lambdas (similares a los proc)
l = lambda{|a,b| puts a,b }
l = lambda{return false}
# Los lambda validan argumentos
# Los lambda pueden retornar cosas
# Se ejecutan con .call

#Estructuras de control 
# Condicionales, IF
# [] significa opcional
#Prefijo
if <condicion> then <I1> [else <I2>] end

if <condicion> [then]
    I1
[elsif <condicion2>
    I2]
[else
    I3]
end
#Postfijo 
I1 if <condition>

#Iteracion, repeticion, While
#Prefijo
while <condition>
    I1
end
while <condition>
    [break,next,redo,retry] if <condition2>
end

#Postfijo
I1 while <condition>

#Fors y Each
for var in col         col.each do |var|
end             --->   end

#Condicional, Case
age = rand 80
when 0..5 
puts "baby"
when 6..12 then 
puts "kid"
when 13..18 then puts "teen"
when 19..59 then puts "adult"
else
    puts "relic"
end

#Expresiones regulares
/tHis iS a Regexp/i
    /^Ah+\??$/    
    /[a-z0-9]*/
    /(match1 (match2) (?:ignored))/
        $1 => match1 match2 ignored
        $2 => match2
        $3 => nil
    %r{(.*)}i
    Regexp.new "(.*)"
if "Ahhh" =~ /A(h*)/
    puts "There are #{$1.size} 'h's"
end
case unkown_string
when /^s/ then puts "Starts with s"
else puts "Doesn't start with s"
end

#Modulos
module Rails
    module ActiveRecord
        class Base
        end
    end
end
Rails::ActiveRecord::Base.new

module Duplicable
    # Supone que existe un método
    def duplicar
        self * self
    end
end

#Clases
class Numero                # Definición
    include Dupicable        # Mixin
end
class Entero < Numero    # Herencia
    def initialize            # Constructor
        @val = 3                # Variable de instancia
        @@last_val = @val # Variable de clase (static)
    end
    def self.max; 5000; end    #Método de clase
end
t = Entero.new                # Inicializamos una clase
t.val                            # Error! Variables de
                                # instancia son privadas

# Getters y Setters
def Entero < Numero
    def setVal val
        @val = val
    end
    def getVal
        @val
    end
end
# -atrr y attr =  
def Entero < Numero
    def val= val
        @val = val
    end
    def val
        @val
    end
end
# att_writer, att_reader
def Entero < Numero
    attr_writer :val
    attr_reader :val
end
# attr_accesor
def Entero < Val
    attr_accessor :val
end

#Sobrecarga
class Test
    def initialize
    end
    def initialize with_argument
    end
end # WRONG: solo queda la última
class Test
    def initialize *args
    end
end # OK

#Excepciones
class MyException < Exception; end
def be_careful!
    raise MyException, "I told you"
end
begin
    be_careful!
rescue MyException => e
    puts e.inspect
end
#<MyException: I told you>

#Expresiones comunes
a = user.address.zip rescue nil
@cached_address = @cached_address || user.address
@cached_address ||= user.address
@nationality = if user.address.nil?
        :unkwown
    else
        user.address.country
    end
a = b? ? b : c? ? c : nil
users.map {|e| e.id} == users.map(&:id)

#Metaprogramacion
1+2 -> 1.send(:+, 2) #Azucar sintactica
a.nil? -> a.send(:nil?) # -> true
# +, -, *, /, << 
#son métodos de instancia de las clases,
# no operadores del lenguaje! 

#Reabrir Clases
bs_to_dollars(20)    		# => 3.17...
class Numeric
    def dollars
        self / 6.3
    end
end
20.dollars  # => 3.17...
3.days.ago  # ¿útil?

#Method Missing
lass Numeric
    def method_missing(m, *args, &block)
        case m
        when /^dollars?$/ then self / 6.3
        when /^pesos?$/ then self * 283.82
        else
            super
        end
    end
end
1.dollar
3.pesos

# Fin guia 1.
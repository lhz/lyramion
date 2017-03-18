bindir=bin

lyramion=$(bindir)/lyramion

default: $(lyramion)

run: $(lyramion)
	$(lyramion)

deps:
	crystal deps

test:
	crystal spec

release: src/lyramion.cr src/*.cr src/**/*.cr $(bindir)
	crystal build --release -o $(lyramion) $<

$(lyramion): src/lyramion.cr src/*.cr src/**/*.cr $(bindir)
	crystal build -o $(lyramion) $<

$(bindir):
	mkdir -p $(bindir)

clean:
	rm bin/lyramion

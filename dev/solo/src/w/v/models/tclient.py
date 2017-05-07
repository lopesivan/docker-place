from .factory import Factory


class TClient(Factory):
    def __init__(self, data_model, template_name):

        Factory.__init__(self, template_name)

        self.data_model = data_model

        self.tmpl.name = "client"

        self.tmpl.log = data_model['log']
        self.tmpl.validation = data_model['validation']
        self.tmpl.etc = data_model['chef_conf_dir']
        self.tmpl.chef = data_model['chef']

    def put(self):
        fileName = "%s.rb" % self.tmpl.name
        print ("File: %s" % fileName)
        print self.tmpl

    def save(self):
        fileName = "%s.rb" % self.tmpl.name
        print ("Save File: %s" % fileName)
        open(fileName, 'w').write(str(self.tmpl))

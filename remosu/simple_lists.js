var SList = function(){
    this._value = null;
    this._next = null;
};

SList.prototype.value = function(){
    return this._value;
};

SList.prototype.find = function(value){
    if(value == this.value() || this.value() == null){
        return this.value() && this;
    } 
    else{
        return this._next.find(value);
    }
};

SList.prototype.add = function(value){
    if(this.value() == null){
        this._value = value;
        this._next = new SList();
    }
    else{
        this._next.add(value);
    }
};

SList.prototype.values = function(){
    if(this.value() == null){
        return [];
    }
    else{
        return [this.value()].concat(this._next.values());
    }
};

SList.prototype.delete = function(node){
    if(node.value() == this.value()){
        this._value = this._next._value; 
        this._next = this._next._next;
    }
    else{
        this._next.delete(node);
    }
}



exports.SList = SList;

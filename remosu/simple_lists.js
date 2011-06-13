var SList = function(){
    this._value = null;
    this._next = null;
};

SList.prototype.value = function(){
    return this._value;
};

SList.prototype.find = function(value){
    if(value == this.value() || this.value() == null){
        return this.value();
    } 
    else{
        return this._next.find(value);
    }
};

exports.SList = SList;

import React, { Component } from "react";
import logo from './Zecl.jpg'; // Tell webpack this JS file uses this image

console.log(logo);

export class Clock extends Component{
    constructor(propos){
        super(propos)
        this.state={
            date:new Date()
        }
    }

    render(){
        return (
            <img src={logo} alt="Logo" width={175} height={100} />
          )
        
    }
}